class List < ActiveRecord::Base
  belongs_to :board
  has_many   :cards, dependent: :destroy

  validates  :name, presence: true,
                    length: { maximum: 15 }
end
