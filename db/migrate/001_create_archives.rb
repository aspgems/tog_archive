class CreateArchives < ActiveRecord::Migration
  def self.up
    create_table :archives do |t|
      t.string  :title
      t.text    :description
      t.integer :user_id
      t.integer :privacy

      t.timestamps
    end
  end

  def self.down
    drop_table :archives
  end
end
