class User < ApplicationRecord
    has_many :event_attendees
    has_many :events, through: :event_attendees

    has_secure_password

    validates :name, :email, presence: true
    validates :email, uniqueness: true

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

    #Reccomendation Methods...


    def get_positive_reviews
        all_reviews = Review.where(user_id: self.id)
        all_reviews.select{|review|review.rating > Review.rating_range.max/2 }
        return all_reviews
    end



    #Category Based
    def get_favourite_cat_by_attendence
        if get_events != []
            cat_hash  = Hash.new(0)
            get_events.each do |event|    
                cat_hash[event.category_id] += 1
            end
            cat_hash.sort_by{|category,total_rating| -total_rating}.first 3
        else
        0
        end
    end

    def get_favourite_cat_by_reviews
        if get_positive_reviews != []
            cat_hash  = Hash.new(0)
            get_positive_reviews.each do |review|    
                cat_hash[review.event.category_id] += review.rating
            end
            cat_hash.sort_by{|category,total_rating| -total_rating}.first 3
        else
        0
        end
    end

    #Host_based

    def get_favourite_host_by_reviews
        if get_positive_reviews != []
            host_hash = Hash.new(0)
            get_positive_reviews.each do |review|
                host_hash[review.event.user_id] += review.rating
            end
            host_hash.sort_by {|host, total_rating| -total_rating}
        else
            0
        end
    end

    def get_favourite_host_by_attendence
        if get_events != []
            host_hash  = Hash.new(0)
            get_events.each do |event|    
                host_hash[event.user_id] += 1
            end
            host_hash.sort_by{|host,total_rating| -total_rating}
        else
        0
        end
    end

    #Venue Based

    def get_favourite_venue_by_reviews
        if get_positive_reviews != []
            venue_hash = Hash.new(0)
            get_positive_reviews.each do |review|
                venue_hash[review.event.venue_id] += review.rating
            end
            venue_hash.sort_by {|venue, total_rating| -total_rating}
        else
            0
        end
    end

    def get_favourite_host_by_attendence
        if get_events != []
            host_hash  = Hash.new(0)
            get_events.each do |event|    
                host_hash[event.user_id] += 1
            end
            host_hash.sort_by{|host,total_rating| -total_rating}
        else
        0
        end
    end





    
end#class end
