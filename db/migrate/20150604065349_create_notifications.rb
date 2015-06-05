class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.string :body
      t.boolean :read, default: false
      t.references :sender, index: true
      t.references :recipient, index: true
      t.references :contract, index: true
      t.timestamps null: false
    end
  end
end
