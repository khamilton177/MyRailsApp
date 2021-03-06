class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, limit:100
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
