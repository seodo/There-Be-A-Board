class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.integer :length, null: false
      t.text :notes
      t.string :status
      t.integer :phase, null: false
      t.integer :mentor_id, null: false
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
