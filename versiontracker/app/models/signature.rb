class Signature < ActiveRecord::Base
  has_many :signature_versions
  has_many :versions, :through => :signature_versions
  belongs_to :user
  
  validates_presence_of :date, :score
end
