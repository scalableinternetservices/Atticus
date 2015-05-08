class AddContractsUsersJoinTable < ActiveRecord::Migration
  def change
    ### For the has_and_belongs_to_many relationship
    create_table :contracts_users, id: false do |t|
        t.belongs_to :user, index: true
        t.belongs_to :contract, index: true
    end
  end
end
