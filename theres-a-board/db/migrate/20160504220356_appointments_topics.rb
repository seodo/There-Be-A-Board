class AppointmentsTopics < ActiveRecord::Migration
  def change
    create_table :appointments_topics do |t|
      t.integer :topic_id
      t.integer :appointment_id
    end
  end
end
