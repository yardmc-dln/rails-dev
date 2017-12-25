class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 
 validates :email, presence: true
 mount_uploader :avatar, AvatarUploader
 has_many :posts
 has_many :comment, dependent: :destroy
 has_many :likes

end
