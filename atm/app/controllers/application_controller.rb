class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_customer!
    @current_customer = Customer.find_by token: params[:token]
    if @current_customer.nil?
      # redirect_to sign_in_path
      render json: {status: "Please Sign in and send a token"}, status: 401
    end
  end
end
