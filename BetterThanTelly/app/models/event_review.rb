class EventReview < ApplicationRecord
  belongs_to :event
  belongs_to :review
end
