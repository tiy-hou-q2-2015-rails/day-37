class Transaction < ActiveRecord::Base

  # Todo: validates integer only
  validates :amount_in_cents, presence: true
  belongs_to :customer

end
