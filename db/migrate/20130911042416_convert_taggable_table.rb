class ConvertTaggableTable < ActiveRecord::Migration
  def up
    remove_column :taggings, :taggable_type
    rename_column :taggings, :taggable_id, :article_id
  end

  def down
    add_column :taggings, :taggable_type, :string
    rename_column :taggings, :article_id, :taggable_id
  end
end
