class ChangeSitePasswordToHashedPassword < ActiveRecord::Migration
  def self.up
    rename_column :sites, :password, :hashed_password
  end

  def self.down
    rename_column :sites, :hashed_password, :password
  end
end
