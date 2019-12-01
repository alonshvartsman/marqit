class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.text :text
      t.datetime :date

      t.timestamps
    end
  end
end
