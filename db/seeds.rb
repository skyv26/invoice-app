require 'faker'

puts "Data seed initiated ...."

10.times do
  sender_address = Address.create(
    type: 'sender',
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    postal_code: Faker::Address.zip_code,
    country: Faker::Address.country
  )

  sender = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email_address: Faker::Internet.email,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    contact: Faker::PhoneNumber.phone_number,
    profile_picture: Faker::Avatar.image,
    address: sender_address
  )

  5.times do
    client_address = Address.create(
      type: 'client',
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      postal_code: Faker::Address.zip_code,
      country: Faker::Address.country
    )

    client = Client.create(
      name: Faker::Name.name,
      email_address: Faker::Internet.email,
      address: client_address
    )

    invoice = Invoice.create(
      description: Faker::Lorem.sentence,
      payment_due_date: Faker::Date.forward(days: 30),
      payment_terms: Faker::Number.between(from: 1, to: 30), # Adjust the range as needed
      status: 'pending',
      total: 1200.00,
      client: client,
      user: sender
    )

    Item.create(
      name: 'ABC',
      quantity: 1,
      price_per_unit: 200.00,
      invoice: invoice
    )

    Item.create(
        name: 'DEF',
        quantity: 1,
        price_per_unit: 200.00,
        invoice: invoice
    )

    Item.create(
        name: 'GHI',
        quantity: 1,
        price_per_unit: 200.00,
        invoice: invoice
    )

    Item.create(
        name: 'JKL',
        quantity: 1,
        price_per_unit: 200.00,
        invoice: invoice
    )
    
    Item.create(
        name: 'MNO',
        quantity: 1,
        price_per_unit: 200.00,
        invoice: invoice
    )

    Item.create(
        name: 'PQR',
        quantity: 1,
        price_per_unit: 200.00,
        invoice: invoice
    )
  end
end

puts "Data seeded successfully ...."
