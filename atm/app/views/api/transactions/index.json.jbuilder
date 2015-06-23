# json.array! @transactions, :amount_in_cents, :created_at

json.customer do
  json.(@current_customer, :first_name, :last_name, :balance, :email)
end

json.transactions do

  json.array! @transactions do |transaction|

    json.(transaction, :amount_in_cents)
    json.created_at transaction.created_at.utc.to_i
    json.created_at_words  "#{ time_ago_in_words transaction.created_at} ago"


  end
end
