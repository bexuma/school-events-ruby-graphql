class Event < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :prices,
                :reject_if => proc { |attrs| attrs['amount'].blank? } #|attrs| attrs['label'].blank? || 
  belongs_to :user

  has_many :participations
  has_many :participating_users, :through => :participations, :source => "user"

  def numberOfParticipants
    participating_users.count
  end

  validates_presence_of :title, :description, :image_name

end
