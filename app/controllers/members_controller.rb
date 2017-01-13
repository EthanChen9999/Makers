class MembersController < ApplicationController
  layout "nested_application", only: [:about, :display]
  def index
    @photo = current_user.photo
  end

  def display

  end
end
