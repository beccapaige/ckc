class User < ActiveRecord::Base
  has_secure_password

  has_many :cats, foreign_key: :owner_id
  has_many :replies
  has_many :favorites

  has_many :topics, foreign_key: :author_id
  has_many :fav_topics, through: :favorites, source: :topic

  def owns(item)
    item.author.id == self.id
  end
end
