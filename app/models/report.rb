class Report < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # def default_picture
  #   if self.photo.url
  #     return true
  #   else
  #     case self.cagtegory
  #     when "road-block"
  #     self.remote_photo_url = "https://images.unsplash.com/photo-1556861466-fa5294c7d285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=<80></80>"
  #     self.save
  #   end
  # end
end
