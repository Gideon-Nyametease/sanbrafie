class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :validatable,authentication_keys: [:login], omniauth_providers: [:google_oauth2]

  attr_writer :login
  # Google authorization
  # def self.from_google(email:, full_name:, uid:, avatar_url:)
  #   return nil unless email =~ /@mybusiness.com\z/
  #   create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  # end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        name = data['name']
        var = name.split(" ")

        user = User.create(
          surname: var.last,
          othernames: var.first,
          username: data['name'],
          email: data['email'],
          uid: data['uid'],
          password: Devise.friendly_token[0,20]
        )
    end
    user
end

def to_s
  email
end

after_create do
  customer = Stripe::Customer.create(email: email)
  update(stripe_customer_id: customer.id)
end

  # Login vie username/email
  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  # validations
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :password_complexity
  # validate :validate_username

  def validate_username
    # if User.where(email: username).exists?
    #   errors.add(:username, :invalid)
    # end
  end
  

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password, 'Password Length should be at least 8 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
