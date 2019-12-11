class Event < ApplicationRecord
  after_create :default_picture
  has_one :chat_room, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  has_many :messages, through: :chat_room
  has_many :users, through: :messages
  # has_many :users, through: :messages
  mount_uploader :photo, PhotoUploader

  after_create :create_chat_room

  def default_picture
    if self.photo.url
      return true
    else
      self.photo = File.open(File.join(".", "app/assets/images/green-tel -aviv.jpeg"))
      self.save
    end
  end

  def create_chat_room
    ChatRoom.create(event: self)
  end
end
