class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :authentication_keys => [:name]
         
  validates :name, presence: true ,length: { minimum: 2,maximum: 20} 
  validates :email, presence: true
  validates :encrypted_password, presence: true 
  validates :introduction, length: { maximum: 50 } 
  
  has_many :books,dependent: :destroy
  attachment :profile_image
end
