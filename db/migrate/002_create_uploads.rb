class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string  :title
      t.text    :description
      t.string  :upload_file_name
      t.string  :upload_content_type
      t.integer :upload_file_size
      t.integer :user_id
      t.integer :archive_id

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
