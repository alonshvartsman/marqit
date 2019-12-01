class Event < ApplicationRecord
  has_many :attendances
  has_many :messages
end
