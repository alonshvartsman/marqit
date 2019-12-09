class ChangeReferencesInMessages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :messages, :event, index: true, foreign_key: true
    add_reference :messages, :chat_room, index: true, foreign_key: true

  end
end
