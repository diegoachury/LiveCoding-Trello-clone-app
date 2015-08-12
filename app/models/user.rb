class User < ActiveRecord::Base
  has_many :boards, dependent: :destroy

  has_secure_password
end
