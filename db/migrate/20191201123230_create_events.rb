class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :name
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
