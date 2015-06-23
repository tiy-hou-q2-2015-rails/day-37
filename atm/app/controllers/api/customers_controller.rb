class Api::CustomersController < ApplicationController

  before_action do
    authenticate_customer!
  end


  def show
    @customer = @current_customer
  end
end
