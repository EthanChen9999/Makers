class MembersController < ApplicationController
  def index
    @photo = current_user.photo
  end
end
