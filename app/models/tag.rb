class Tag < ApplicationRecord
  has_many :event_taggings
  has_many :events, through: :event_taggings

  has_many :user_taggings
  has_many :users, through: :user_taggings

  before_save { name.downcase! }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
