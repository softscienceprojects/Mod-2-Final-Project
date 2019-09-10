class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user
  
  has_many :reviews

  has_many :event_attendees
  has_many :users, through: :event_attendees

  accepts_nested_attributes_for :venue

  validates :title, :description, :event_date, :event_time, :venue_id, :category_id, presence: true


  def event_in_future?
    self.event_date > Date.today
  end

  def event_attendees_list
      self.users
  end

  def attendance?
    self.users.include?(@current_user)
  end

  def event_attendee?
    #will return true if their attendee record is not empty (e.g. they attended)
    if EventAttendee.where(event_id: self.id, user_id: @current_user)
      return true
    end
  end

  def in_future_and_attending
    self.event_in_future? && self.event_attendee?
  end

end
