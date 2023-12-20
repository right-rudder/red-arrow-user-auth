# app/models/aircraft.rb
class Aircraft < ApplicationRecord
    has_many :events
    validates :status, inclusion: { in: %w[Active Inactive], message: "%{value} is not a valid status" }
end