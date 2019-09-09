class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event_review

end
