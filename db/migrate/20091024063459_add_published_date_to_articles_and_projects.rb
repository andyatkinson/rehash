class AddPublishedDateToArticlesAndProjects < ActiveRecord::Migration
  def self.up
    add_column :articles, :published_on, :date
    add_column :projects, :completed_on, :date
  end

  def self.down
    remove_column :projects, :completed_on
    remove_column :articles, :published_on
  end
end
