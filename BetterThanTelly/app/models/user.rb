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

    #Reccomendation Engine...


    def get_positive_reviews
        all_reviews = Review.where(user_id: self.id)
        all_reviews.select{|review|review.rating > Review.rating_range.max/2 }
        return all_reviews
    end


    def top_three(list1,list2)
        list_merge = list1.push(list2).flatten.each_slice(2).map(&:first).uniq
        three_only = list_merge.first 3
    end

    def favourite_profile
        categories = top_three(get_favourite_cat_by_reviews, get_favourite_cat_by_attendence)
        hosts =  top_three(get_favourite_host_by_reviews, get_favourite_host_by_attendence)
        venues = top_three(get_favourite_venue_by_reviews, get_favourite_host_by_attendence)
        return "Categories: #{categories}, Hosts: #{hosts}, Venures #{venues}"
    end


    #Category Based
    def get_favourite_cat_by_attendence
        if get_events != []
            cat_hash  = Hash.new(0)
            get_events.each do |event|    
                cat_hash[event.category.name] += 1
            end
            cat_hash.sort_by{|category,total_rating| -total_rating}#.first 3
            #cat_hash.to_h
        else
        0
        end
    end

    def get_favourite_cat_by_reviews
        if get_positive_reviews != []
            cat_hash  = Hash.new(0)
            get_positive_reviews.each do |review|    
                cat_hash[review.event.category.name] += review.rating
            end
            cat_hash.sort_by{|category,total_rating| -total_rating}#.first 3
            #cat_hash.to_h
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
