class CreateTags < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
      t.string :skill_name
      t.timestamps null: false
    end
    
    create_table :industry_tags do |t|
      t.string :industry_name
      t.timestamps null: false
    end

    create_table :user_skill_tag, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :skill_tag, index: true
    end
    
    create_table :user_industry_tag, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :industry_tag,  index: true
    end
  end
end
