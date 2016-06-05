class TransactionsController < ApplicationController
  def new
    @client_token = generate_client_token
  end

  def create
    nonce = params[:payment_method_nonce]

    # created_customer = Braintree::Customer.create(
    #   :first_name => params[:first_name],
    #   :last_name => params[:last_name],
    #   :email => params[:email],
    #   :phone => params[:phone]
    #   )

    unless current_user.has_payment_info?
      @result = Braintree::Transaction.sale(
        :amount => "9.00",
        :payment_method_nonce => nonce,
        customer: {
          first_name: params[:first_name],
          last_name: params[:last_name],
          company: params[:company],
          email: current_user.email,
          phone: params[:phone]
        },
        options: {
          store_in_vault: true
        })
    else
      @result = Braintree::Transaction.sale(
        :amount => "9.00",
        :payment_method_nonce => nonce
      )
    end

    p "result is: #{@result}"

    if @result.success?
      # => Customer's Braintree id is saved in my model to use later. Along with above Transaction customer creation, trumps need for creating customer separately.
      current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
      flash[:notice] = "Payment was successful!"
    else
      flash[:error] = @result.message
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
