class User < ApplicationRecord
    has_many :event_attendees
    has_many :events, through: :event_attendees

    has_secure_password


    def no_past_events_message
        return "You haven't been to any events"
    end

    def no_future_events_message
        return "You're not going to any events"
    end

    def no_past_hosted_events_message
        return "You haven't previously hosted any events"
    end

    def no_future_hosting_events_message
        return "You are not hosting any events"
    end

    def get_events
        self.events
    end

    def get_host_events
        Event.where(user_id: self.id)
    end


    def get_past_events
        past_events = get_events.select{|event| event.event_date < Date.today}
        if past_events == []
            past_events = [no_past_events_message]
        end
        return past_events
    end


    def get_future_events
        future_events = get_events.select{|event| event.event_date >= Date.today}
        if future_events == []
            future_events = [no_future_events_message]
        end
        return future_events
    end

    def get_past_host_events
        past_host_events = get_host_events.select{|event| event.event_date < Date.today}
        if past_host_events == []
            past_host_events = [no_past_hosted_events_message]
        end
        return past_host_events
    end

    def get_future_host_events
        future_host_events = get_host_events.select{|event| event.event_date >= Date.today}
        if future_host_events == []
            future_host_events = [no_future_hosting_events_message]
        end
        return future_host_events
    end

    
end#class end
