class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :title
      t.string :company
      t.string :description
      t.string :image_url
      t.decimal :pay
      t.boolean :progress, default: false
      t.boolean :done, default: false
      t.string :owner
      t.string :worker, default: ""

      t.timestamps null: false
    end
  end
end
