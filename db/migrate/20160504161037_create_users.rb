class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :photo_path
      t.string :phone_number
      t.string :type, default: "Student"

      t.timestamps null: false
    end
  end
end
