class Board < ActiveRecord::Base
  belongs_to :user
  has_many   :lists, dependent: :destroy

  validates :name, presence: true,
                   length: { maximum: 15 }

  validates :description, length: { maximum: 100 }
end
