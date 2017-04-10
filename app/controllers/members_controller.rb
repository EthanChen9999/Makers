class MembersController < ApplicationController

  def index

  end
  def show
    @uploader = User.find_by_username(params[:id])

    @photo = @uploader.photo
    @profile = @uploader.profile
    @products = @uploader.products

  end


  def display
    render layout: false
  end
end
