class Price < ApplicationRecord
  belongs_to :event

  validates_presence_of :amount
end
