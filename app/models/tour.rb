class Tour < ApplicationRecord
    has_one_attached :image
    
    validates :title, presence: true
    # validates :price, numeric: true
    validates :start_date, presence: true
    validates :end_date, presence: true
end
