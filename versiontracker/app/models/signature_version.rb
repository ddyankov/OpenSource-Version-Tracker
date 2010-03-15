class SignatureVersion < ActiveRecord::Base
  belongs_to :signature
  belongs_to :version
end
