class UsersTopics < ActiveRecord::Migration
  def change
    create_table :users_topics do |t|
      t.integer :topic_id
      t.integer :mentor_id
    end
  end
end
