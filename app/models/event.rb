class Event < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :reviews, -> { order 'id desc' }, dependent: :destroy

  accepts_nested_attributes_for :prices,
                :reject_if => proc { |attrs| attrs['amount'].blank? } #|attrs| attrs['label'].blank? || 
  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :participations, dependent: :destroy
  has_many :participating_users, :through => :participations, :source => "user"

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def participantIds
    participating_users.pluck(:id)
  end

  validates_presence_of :title, :description, :image_name

end
