class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :avatar
  
  has_many :comments
  
  has_many :groups_users
  has_many :groups, through: :groups_users

  has_many :created_groups, class_name: :group, foreign_key: :created_by

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/gif", "image/png"]

  def full_name
    self.first_name + " " + self.last_name
  end

end
