class User < ApplicationRecord
  acts_as_voter
  # after_create :default_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_many :messages, dependent: :destroy
  has_many :messeged_events, through: :messages, source: :event
  mount_uploader :photo, PhotoUploader

  # def default_picture
  #   unless self.photo
  #     current_user.photo = File.open(File.join(".", "app/assets/images/logo.png"))
  #     current_user.save
  #   end
  # end

  def attending?(event)
    events.include?(event)
  end
end
