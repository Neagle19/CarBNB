class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :status, presence: true

      t.timestamps
    end
  end
end
