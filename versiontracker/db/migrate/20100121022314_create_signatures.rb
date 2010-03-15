class CreateSignatures < ActiveRecord::Migration
  def self.up
    create_table :signatures do |t|
      t.timestamp :date
      t.float :score
      t.integer :id 	
      t.timestamps
    end
  end

  def self.down
    drop_table :signatures
  end
end
