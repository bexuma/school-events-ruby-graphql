class Tag < ApplicationRecord
  has_many :events, through: :taggings

  before_save { name.downcase! }

  validates_presence_of :name

end
