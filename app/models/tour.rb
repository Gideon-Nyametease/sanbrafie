class Tour < ApplicationRecord
    has_one_attached :image
    
    validates :title, presence: true
    # validates :price, numeric: true
    validates :start_date, presence: true
    validates :end_date, presence: true


     # create stripe product and assign to this product
    after_create do
        trip = Stripe::Product.create(name: title)
        price = Stripe::Price.create(product: trip, unit_amount: self.price, currency: self.currency)
        update(stripe_product_id: trip.id, stripe_price_id: price.id)
    end

    # stripe keeps products and prices separately. 
    # updating local prices would require to update or create stripe prices.
    # this is all additional complexity.
    # better just create new products.

    # after_update :create_and_assign_new_stripe_price, if: :saved_change_to_price?
    # after_update :create_and_assign_new_stripe_price, if: :saved_change_to_currency?

    # def create_and_assign_new_stripe_price
    #   price = Stripe::Price.create(product: self.stripe_product_id, unit_amount: self.price, currency: self.currency)
    #   update(stripe_price_id: price.id)
    # end
end
