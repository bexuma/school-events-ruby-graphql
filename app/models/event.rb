class Event < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :prices,
                :reject_if => proc { |attrs| attrs['label'].blank? || attrs['amount'].blank? }
  belongs_to :user

  validates_presence_of :title, :description

end
