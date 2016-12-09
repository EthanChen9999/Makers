class MembersController < ApplicationController
  layout "nested_application", only: [:about, :display]
  def index
    @photo = current_user.photo
  end
  def about

  end
  def display

  end
end
