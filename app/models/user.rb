class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  has_many :messages
  has_many :attendances
  has_many :events, through: :attendances
  has_many :messeged_events, through: :messages, source: :events
  mount_uploader :photo, PhotoUploader

  def default_picture
    if self.photo.url
      return true
    else
      self.remote_photo_url = "https://images.unsplash.com/photo-1461938337379-4b537cd2db74?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
      self.save
    end
  end
end
