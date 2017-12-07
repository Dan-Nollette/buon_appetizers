class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text_body
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end