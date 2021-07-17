class AddColumnsToBookingInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_infos, :status, :string
    add_column :booking_infos, :user_id, :integer
  end
end
