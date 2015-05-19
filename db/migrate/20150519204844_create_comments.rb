class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.references :contract, index: true
      t.references :parent, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :contracts
  end
end
