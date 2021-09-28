class Tour < ApplicationRecord
    has_one_attached :image
    
    validates :title, presence: true
    # validates :price, numeric: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    def self.gen_assigned_id
        sql = "select nextval('tour_seq')"
        val = ActiveRecord::Base.connection.execute(sql)
        val = val.values[0][0]
        val = val.to_s.rjust(5,'0')
        logger.info "Tour ID, #{val}"
        val
    end

    def self.check_seq_code

        assigned_id = loop do
            assigned_id=gen_assigned_id
            break assigned_id unless Tour.exists?(tour_id: assigned_id)
        end

        return assigned_id
    end

    def self.update_last_but_one(table,id_field,id)
        sql = "UPDATE #{table} SET active_status = false, del_status = true   WHERE id = (SELECT id FROM #{table} WHERE #{id_field} = '#{id}' AND active_status = true AND del_status  = false order by id asc LIMIT 1)"
        val = ActiveRecord::Base.connection.execute(sql)
        # logger.info "VALUE: #{val.inspect}"
    end

     # create stripe product and assign to this product
    after_create do
        trip = Stripe::Product.create(name: title)
        price = Stripe::Price.create(product: trip, unit_amount: self.price, currency: self.currency)
        update(stripe_product_id: trip.id, stripe_price_id: price.id)
    end

    # after_update do
    #     trip = Stripe::Product.create(name: title)
    #     price = Stripe::Price.create(product: trip, unit_amount: self.price, currency: self.currency)
    #     update(stripe_product_id: trip.id, stripe_price_id: price.id)
    # end

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
