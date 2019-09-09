class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user

  has_many :event_reviews
  has_many :reviews, through: :event_reviews

  has_many :event_attendees
  has_many :users, through: :event_attendees
end
