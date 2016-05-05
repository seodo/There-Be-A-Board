class RemoveStatusFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :status
  end
end
