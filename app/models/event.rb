class Event < ApplicationRecord
  has_many :attendances
  has_many :messages
  mount_uploader :photo, PhotoUploader
end
