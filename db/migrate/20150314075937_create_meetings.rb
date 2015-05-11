class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :building
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :country
      t.string :meeting_type
      t.string :day
      t.datetime :time
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :owner
      t.string :status

      t.timestamps
    end
  end
end
