class Report < ApplicationRecord
  after_create :default_picture
  validates :location, presence: true
  validates :category, presence: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  acts_as_voteable

  def default_picture
    base_path = File.join(".", "app/assets/images/icons/")
    if self.photo_url
      return true
    else
      case self.category
      when "Road Block"
        self.photo = File.open(base_path + 'road_block.png')
        self.save
      when "Trash"
        self.photo = File.open(base_path + 'trash_can.png')
        self.save
      when "Traffic Light"
        self.photo = File.open(base_path + 'traffic_light_2.png')
        self.save
      when "Sewage"
        self.photo = File.open(base_path + 'sewer.png')
        self.save
      when "Water Leak"
        self.photo = File.open(base_path + 'tear_drop.png')
        self.save
      when "Pothole"
        self.photo = File.open(base_path + 'pothole.svg')
        self.save
      when "other"
        self.photo = File.open(base_path + 'other.png')
        self.save
      when "Street Light"
        self.photo = File.open(base_path + 'broken_light.png')
        self.save
      when "Exterminate"
        self.photo = File.open(base_path + 'rat.png')
        self.save
      end
    end
  end
end
