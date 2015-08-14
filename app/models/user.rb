class User < ActiveRecord::Base
  has_many :boards, dependent: :destroy
  has_secure_password

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 10 },
                   uniqueness: { case_sensitive: false }
end
