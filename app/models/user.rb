class User < ApplicationRecord
  acts_as_voter
  after_create :default_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  has_many :messages, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_many :messeged_events, through: :messages, source: :events
  mount_uploader :photo, PhotoUploader

  def default_picture
    if self.photo.url
      return true
    else
      self.photo = File.open(File.join(".", "app/assets/images/avatar.png"))
      self.save
    end
  end
end
