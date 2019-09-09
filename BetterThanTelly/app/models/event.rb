class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user
  
  has_many :reviews

  has_many :event_attendees
  has_many :users, through: :event_attendees

  accepts_nested_attributes_for :venue

  def event_in_future?
    self.event_date > Date.today
  end

  def event_attendees_list
      self.users
  end

  def attendance?
    !self.users.include?(@current_user)
  end

end
