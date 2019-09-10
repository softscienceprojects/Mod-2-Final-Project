class User < ApplicationRecord
    has_many :event_attendees
    has_many :events, through: :event_attendees

    has_secure_password


    def get_events
        self.events
    end

    def get_host_events
        Event.where(user_id: self.id)
    end


    def get_past_events
        get_events.select{|event| event.event_date < Date.today}
    end

    def get_future_events
        get_events.select{|event| event.event_date >= Date.today}
    end

    def get_past_host_events
        get_host_events.select{|event| event.event_date < Date.today}
    end

    def get_future_host_events
        get_host_events.select{|event| event.event_date >= Date.today}
    end

    
end#class end
