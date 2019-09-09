class Review < ApplicationRecord
  belongs_to :event
  
  # has_many :event_reviews
  # has_many :events, through: :event_reviews



end
