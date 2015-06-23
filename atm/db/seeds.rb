
jwo = Customer.create! email: "jesse@theironyard.com", first_name: "Jesse", last_name: "Wolgamott", password: "12345678", password_confirmation: "12345678"
jwo.transactions.create! amount_in_cents: 5000
jwo.transactions.create! amount_in_cents: -1000

puts jwo.balance
