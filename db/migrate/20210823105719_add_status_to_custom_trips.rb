class AddStatusToCustomTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :custom_trips, :status, :boolean
    add_column :custom_trips, :user_id, :integer
  end
end
