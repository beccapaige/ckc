class Topic < ActiveRecord::Base
  has_many :replies
  has_many :favorites

  has_many :fans, through: :favorites, source: :user

  belongs_to :forum

  belongs_to :author, class_name: "User"
end
