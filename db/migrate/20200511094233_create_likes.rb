class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user,  foreign_key: true, index: true
      t.references :post,  foreign_key: true, index: true
      t.timestamps
    end
    add_index :likes, [:user_id, :post_id], unique: true
  end
end
