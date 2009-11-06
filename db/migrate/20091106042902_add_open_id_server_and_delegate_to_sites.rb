class AddOpenIdServerAndDelegateToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :open_id_server, :string
    add_column :sites, :open_id_delegate, :string
  end

  def self.down
    remove_column :sites, :open_id_delegate
    remove_column :sites, :open_id_server
  end
end
