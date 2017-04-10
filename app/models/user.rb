class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :photo, :dependent => :destroy
  has_one :jumbotron, :dependent => :destroy
  has_many :products, :dependent => :destroy
  accepts_nested_attributes_for :photo
  accepts_nested_attributes_for :jumbotron

  def update_without_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password].blank?

    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
