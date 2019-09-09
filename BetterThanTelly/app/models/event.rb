class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user
  
  has_many :reviews

  has_many :event_attendees
  has_many :users, through: :event_attendees

  accepts_nested_attributes_for :venue

  def event_in_future
    if self.event_date > Date.today
      self
    end
  end


end
