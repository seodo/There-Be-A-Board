class RemoveEndTimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :end_time
  end
end
