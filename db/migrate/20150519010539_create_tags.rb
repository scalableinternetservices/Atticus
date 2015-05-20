class CreateTags < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
      t.string :name
      t.timestamps null: false
    end
    
    create_table :industry_tags do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
