class Venue < ApplicationRecord
    has_many :events

    validates :name, :address, presence: true

end
