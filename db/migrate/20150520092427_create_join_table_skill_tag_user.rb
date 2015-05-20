class CreateJoinTableSkillTagUser < ActiveRecord::Migration
  def change
    create_join_table :skill_tags, :users do |t|
      # t.index [:skill_tag_id, :user_id]
      # t.index [:user_id, :skill_tag_id]
    end
  end
end
