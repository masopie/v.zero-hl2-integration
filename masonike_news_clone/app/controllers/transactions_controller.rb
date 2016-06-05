class TransactionsController < ApplicationController
  def new
    @client_token = generate_client_token
  end

  def create
    nonce = params[:payment_method_nonce]

    unless current_user.has_payment_info?
      @result = Braintree::Transaction.sale(
        :amount => "10.00",
        :payment_method_nonce => nonce,
        customer: {
          
        }
      )
    else
      @result =
    end

    if @result.success?
      flash[:notice] = "Payment was successful!"
    else
      flash[:error] = @result.message
      # render "/"
    end
  end

  private

  # => Upgraded private method for ULTRA VAULT ACTION

  def generate_client_token
    if current_user.has_payment_info?
      Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
      Braintree::ClientToken.generate
    end
  end
end
