class CreateJoinTableContractSkillTag < ActiveRecord::Migration
  def change
    create_join_table :contracts, :skill_tags do |t|
      # t.index [:contract_id, :skill_tag_id]
      # t.index [:skill_tag_id, :contract_id]
    end
  end
end
