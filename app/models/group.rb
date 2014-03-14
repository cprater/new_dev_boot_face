class Group < ActiveRecord::Base

	belongs_to :user
  has_many :groups_users
  has_many :users, through: :groups_users
  belongs_to :creator, class_name: :user, foreign_key: :created_by
  has_many :posts

end
