class User < ActiveRecord::Base
  has_many :boards, dependent: :destroy
end
