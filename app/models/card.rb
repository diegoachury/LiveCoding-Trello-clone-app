class Card < ActiveRecord::Base
  belongs_to :list

  validates :name, length: { minimum: 3, maximum: 25 }
end
