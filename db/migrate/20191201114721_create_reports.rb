class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :category
      t.text :description
      t.string :location
      t.integer :upvote
      t.references :user

      t.timestamps
    end
  end
end
