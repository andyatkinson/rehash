class AddTwitterAndFlickrToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :flickr_username, :string
    add_column :sites, :twitter_username, :string
  end

  def self.down
    remove_column :sites, :twitter_username
    remove_column :sites, :flickr_username
  end
end
