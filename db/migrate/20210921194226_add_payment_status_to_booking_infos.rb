class AddPaymentStatusToBookingInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_infos, :payment_status, :boolean
  end
end
