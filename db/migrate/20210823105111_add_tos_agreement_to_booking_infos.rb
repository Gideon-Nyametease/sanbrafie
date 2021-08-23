class AddTosAgreementToBookingInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_infos, :tos_agreement, :boolean
    add_column :custom_trips, :tos_agreement, :boolean
  end
end
