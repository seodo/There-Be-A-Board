class TopicsUsers < ActiveRecord::Migration
  def change
    create_table :topics_users do |t|
     t.integer :topic_id
      t.integer :mentor_id
    end
  end
end
