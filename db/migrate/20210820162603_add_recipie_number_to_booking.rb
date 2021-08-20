class AddRecipieNumberToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :recipie_number, :string
  end
end
