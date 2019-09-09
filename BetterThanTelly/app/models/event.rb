class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user
  
  has_many :reviews

  has_many :event_attendees
  has_many :users, through: :event_attendees

  accepts_nested_attributes_for :venue

  def attend(user, event)
    attend = EventAttendee.create(user_id: user, event_id: event)
  end


end
