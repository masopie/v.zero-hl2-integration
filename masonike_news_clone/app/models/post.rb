class Post < ActiveRecord::Base

  has_many :comments
  has_many :commenters, through: :comments, source: :user
  belongs_to :submitter, class_name: "User", foreign_key: :user_id

  def age
    ((Time.now - created_at) / 3600).round
  end

  def comment_count
    comments.count
  end

end
