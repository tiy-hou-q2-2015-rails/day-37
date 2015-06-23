require 'securerandom'

class Api::SessionController < ApplicationController

  def create
    email = params[:email]
    password = params[:password]

    @customer = Customer.find_by email: email
    if (@customer) && (@customer.authenticate password)
      # session[:customer_id] = customer.id
      # redirect_to root_path
      # render

      # choices:
      #   * header
      #   * token in the query-string (params)

      # /me    => 401 must auth
      # /me?token=blsdafyutsdf => 👍

      @customer.update_attribute :token, SecureRandom.hex(8)




    else
      # render :new
      render json: {status: "Problem with your email or password"}, status: 422
    end
  end
end
