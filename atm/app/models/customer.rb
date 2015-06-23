class Customer < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  has_secure_password
  has_many :transactions

  def balance
    transactions.map{|t| t.amount_in_cents}.sum
  end

end
