class Api::TransactionsController < ApplicationController

  before_action do
    authenticate_customer!
  end

  def index
    @transactions = @current_customer.transactions
  end

  def create
    # @transaction = @current_customer.transactions.create
    @transaction = Transaction.new params.require(:transaction).permit(:amount_in_cents)
    @transaction.customer = @current_customer
    if @transaction.save
      render :index, status: 201
    else
      render json: @transaction.errors, status: 422
    end


  end
end
