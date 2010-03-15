class Component < ActiveRecord::Base

  validates_presence_of :name,:c_type
  has_many  :versions

end
