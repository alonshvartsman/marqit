class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
  validates :content, presence: true, allow_blank: false
  has_one :event, through: :chat_room

  def from?(some_user)
    user == some_user
  end
end
