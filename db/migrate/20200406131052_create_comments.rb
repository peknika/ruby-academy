class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true
      t.text :content
      t.timestamps
    end
  end
end
