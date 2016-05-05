class AddDefaultStatusOfOpenToAppointments < ActiveRecord::Migration
  def change
    change_column :appointments, :status, :string, default: "open"
  end
end
