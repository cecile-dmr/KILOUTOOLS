class AddPriceToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :price, :string
  end
end
