require 'http'

# Sign in

result = JSON.parse(Http.post("http://localhost:3000/auth.json", json: {email: "jesse@theironyard.com", password: "12345678"}))

token = result["token"]

me = JSON.parse(Http.get("http://localhost:3000/me.json?token=#{token}"))

opening_balance = me["balance"]

puts "My token #{token}. My Balance #{opening_balance}"

# puts the balance
# deposit $20

Http.post("http://localhost:3000/transactions.json?token=#{token}", json: {transaction: {amount_in_cents: 2000}})


# puts the new balance

me = JSON.parse(Http.get("http://localhost:3000/me.json?token=#{token}"))

new_balance = me["balance"]

puts "Now my balance is #{new_balance}"
