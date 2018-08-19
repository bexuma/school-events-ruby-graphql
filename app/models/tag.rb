class Tag < ApplicationRecord
  has_many :taggings
  has_many :events, through: :taggings

  before_save { name.downcase! }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
