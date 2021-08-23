class CustomTrip < ApplicationRecord

    validates :tos_agreement, presence: true
    validates :surname, presence: true
    validates :othernames, presence: true
    validates :email, presence: true
    validates :hotel_type, presence: true
    # validates_uniqueness_of :country_desc, on: :create
    validates :group_count, numericality: { :greater_than_or_equal_to => 1 ,message: "Please enter 1 or greater" }
end
