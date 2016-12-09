class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :photo, :dependent => :destroy
  has_many :products, :dependent => :destroy
  accepts_nested_attributes_for :photo
end
