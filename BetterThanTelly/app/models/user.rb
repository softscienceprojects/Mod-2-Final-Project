class User < ApplicationRecord
    has_many :event_attendees
    has_many :events, through: :event_attendees
end
