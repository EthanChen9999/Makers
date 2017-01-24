class MembersController < ApplicationController

  def index
    @photo = current_user.photo
  end

  def display
    render layout: false

  end
end
