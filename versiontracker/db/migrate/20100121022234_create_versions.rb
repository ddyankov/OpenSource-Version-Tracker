class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string :version_num
      t.integer :id
      t.integer :component_id
	  t.string  :sig_id
      t.timestamps
    end
  end

  def self.down
    drop_table :versions
  end
end
