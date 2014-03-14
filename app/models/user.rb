class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :comments
  
  has_many :groups_users
  has_many :groups, through: :groups_users

  has_many :created_groups, class_name: :group, foreign_key: :created_by

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    self.first_name + " " + self.last_name
  end
end
