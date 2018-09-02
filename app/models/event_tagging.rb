class EventTagging < ApplicationRecord
  belongs_to :event
  belongs_to :tag

  validates :tag_id, presence: true
  validates :event_id, presence: true

  validates_uniqueness_of :tag_id, :scope => [:event_id]
end
