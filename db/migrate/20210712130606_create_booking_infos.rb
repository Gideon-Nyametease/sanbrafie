class CreateBookingInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_infos do |t|
      t.string :surname
      t.string :othernames
      t.string :phone_number
      t.string :coordination_preference
      t.integer :group_count
      t.string :hotel_type
      t.integer :tour_duration
      t.text :purpose_statement

      t.timestamps
    end
  end
end
