class Comment < ActiveRecord::Base

  belongs_to :commenter, class_name: "User", foreign_key: :user_id
  belongs_to :post

  def age
    ((Time.now - created_at) / 3600).round
  end

end
