class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :mentor_id
      t.integer :student_id
      t.integer :rating, null: false
      t.text :body, null: false
      t.integer :appointment_id

      t.timestamps null: false
    end
  end
end
