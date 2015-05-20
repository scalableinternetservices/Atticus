class AddPictureToContracts < ActiveRecord::Migration
  def self.up
    add_attachment :contracts, :picture
  end

  def self.down
    remove_attachment :contracts, :picture
  end
end
