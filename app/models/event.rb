class Event < ApplicationRecord
  has_many :attendances
  has_many :messages
  has_many :users, through: :attendances
  has_many :users, through: :messages
  mount_uploader :photo, PhotoUploader

  def default_picture
    if self.photo.url
      return true
    else
      self.remote_photo_url = "https://images.unsplash.com/photo-1556861466-fa5294c7d285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=<80></80>"
      self.save
    end
  end
end
