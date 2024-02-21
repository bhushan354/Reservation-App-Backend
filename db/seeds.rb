# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create admin user
admin = User.create(username: 'admin', firstName: 'Admin', lastName: 'User', city: 'AnyCity', email: 'admin@example.com', password: 'password')

# Create regular users
user1 = User.create(username: 'john_doe', firstName: 'John', lastName: 'Doe', city: 'New York')
user2 = User.create(username: 'jane_smith', firstName: 'Jane', lastName: 'Smith', city: 'Los Angeles')

# Create Items
item1 = Item.create(admin: admin, name: 'Item 1', image: 'image_data_1', description: 'Description 1', city: 'Chicago', admin_id: '1')
item2 = Item.create(admin: admin, name: 'Item 2', image: 'image_data_2', description: 'Description 2', city: 'San Francisco', admin_id: '1')
item3 = Item.create(admin: admin, name: 'Item 3', image: 'image_data_3', description: 'Description 3', city: 'Seattle', admin_id: '1')

# Create Reservations
reservation1 = Reservation.create(customer: user2, reserve_for_use_date: Date.today, city: 'Los Angeles', customer_id: '1')
reservation2 = Reservation.create(customer: user1, reserve_for_use_date: Date.tomorrow, city: 'New York', customer_id: '1')

# Create ReservationItems
ReservationItem.create(reservation: reservation1, item: item1)
ReservationItem.create(reservation: reservation1, item: item2)
ReservationItem.create(reservation: reservation2, item: item3)
puts 'data added success'