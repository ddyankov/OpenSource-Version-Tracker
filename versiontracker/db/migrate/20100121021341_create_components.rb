class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :name
      t.string :c_type
#      t.integer :id	
      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
