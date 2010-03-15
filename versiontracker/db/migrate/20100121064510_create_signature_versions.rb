class CreateSignatureVersions < ActiveRecord::Migration
  def self.up
    create_table :signature_versions do |t|
      t.integer :signature_id
      t.integer   :version_id
      t.timestamps
    end
  end

  def self.down
    drop_table :signature_versions
  end
end
