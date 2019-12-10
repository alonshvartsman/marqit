class Event < ApplicationRecord
  after_create :default_picture
  has_one :chat_room
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_many :messages, through: :chat_room
  has_many :users, through: :messages
  # has_many :users, through: :messages
  mount_uploader :photo, PhotoUploader

  def default_picture
    if self.photo.url
      return true
    else
      self.photo = File.open(File.join(".", "app/assets/images/green-tel -aviv.jpeg"))
      self.save
    end
  end

  def attending?(user)
    users.find_by(id: user.id)
  end
end
