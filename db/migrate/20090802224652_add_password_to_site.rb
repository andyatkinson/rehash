class AddPasswordToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :password, :string
  end

  def self.down
    remove_column :sites, :password
  end
end
