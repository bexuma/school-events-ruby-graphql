class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { email.downcase! }

  has_many :hosted_events, class_name: "Event"

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
end
