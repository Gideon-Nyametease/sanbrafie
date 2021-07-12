class AddTourIdToBookingInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_infos, :tour_id, :integer
  end
end
