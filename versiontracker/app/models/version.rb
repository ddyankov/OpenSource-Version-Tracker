class Version < ActiveRecord::Base
  has_many :signature_versions
  has_many :signatures, :through => :signature_versions
  belongs_to :component

  validates_presence_of :version_num
end
