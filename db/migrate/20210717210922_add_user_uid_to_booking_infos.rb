class AddUserUidToBookingInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_infos, :user_uid, :string
  end
end
