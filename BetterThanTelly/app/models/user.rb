class User < ApplicationRecord
    has_many :event_attendees
    has_many :events, through: :event_attendees

    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true

    def attendance_list
        #self.
    end

    
end
