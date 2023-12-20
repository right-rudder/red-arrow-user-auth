class Event < ApplicationRecord
  belongs_to :user
  belongs_to :aircraft
 # belongs_to :instructor, required: false
end
