class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.string :attachable_type
      t.integer :attachable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
