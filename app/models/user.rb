class User < ActiveRecord::Base
  has_secure_password
  enum type: {acceptor: 0, donor: 1}
  validates :mobile, presence: true, phone: true
  validates :full_name, presence: true


end
