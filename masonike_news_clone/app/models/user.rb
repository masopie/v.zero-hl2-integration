class User < ActiveRecord::Base
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  has_many :posts

  has_secure_password

  def has_payment_info?
    braintree_customer_id
  end

end
