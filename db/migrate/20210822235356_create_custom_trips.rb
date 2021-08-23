class CreateCustomTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_trips do |t|
      t.string :destination
      t.string :surname
      t.string :othernames
      t.string :email
      t.string :phone_number
      t.string :coordination_preference
      t.integer :group_count
      t.string :hotel_type
      t.integer :trip_duration
      t.string :purpose_statement
      t.text :comment

      t.timestamps
    end
  end
end
