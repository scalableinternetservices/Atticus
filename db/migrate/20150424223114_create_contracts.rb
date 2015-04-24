class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :title
      t.string :company
      t.string :description
      t.string :image_url
      t.decimal :pay

      t.timestamps null: false
    end
  end
end
