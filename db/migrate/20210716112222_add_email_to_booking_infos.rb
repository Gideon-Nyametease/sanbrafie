class AddEmailToBookingInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_infos, :email, :string
  end
end
