class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :description
      t.references :user
      t.timestamps
    end
    add_foreign_key :posts, :users, on_delete: :cascade
  end
end
