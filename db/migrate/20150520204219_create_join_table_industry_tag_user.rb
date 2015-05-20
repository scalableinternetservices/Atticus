class CreateJoinTableIndustryTagUser < ActiveRecord::Migration
  def change
    create_join_table :industry_tags, :users do |t|
      # t.index [:industry_tag_id, :user_id]
      # t.index [:user_id, :industry_tag_id]
    end
  end
end
