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

    def get_favourite_cat_by_attendence
       all_cats = get_events.map{|event|event.category_id}
       if all_cats != []
       favourite_cat = all_cats.max_by{|cat|all_cats.count(cat)}
       Category.find(favourite_cat).name
       else
        0
       end
    end

    def get_favourite_cat_by_reviews
        all_reviews = Review.where(user_id: self.id)
            if all_reviews != []
                cat_hash  = Hash.new(0)
                all_reviews.each do |review|
                cat_hash[review.event.category.name] += review.rating
                end
                cat_hash.sort_by {|category,total_rating|total_rating}.last[0]
            else
            0
            end
    end


    
end#class end
