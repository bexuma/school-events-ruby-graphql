class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { email.downcase! }

  has_many :hosted_events, class_name: "Event", dependent: :destroy

  has_many :participations, dependent: :destroy
  has_many :participatingEvents, :through => :participations, :source => "event"
  has_many :reviews, dependent: :destroy

  has_many :user_taggings
  has_many :tags, through: :user_taggings

  def followingTags
    tags.pluck(:id)
  end

  has_secure_password

  validates :email,
          presence: true,
          length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

  validates :password,
          presence: true,
          length: { minimum: 6 }

  validates :name,
          presence: true,
          length: { maximum: 78 }

  validates :avatar,
          presence: true

  validates :username,
          presence: true

end
