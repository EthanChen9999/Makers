class RegistrationsController < Devise::RegistrationsController


  def edit
    self.resource.build_photo
    render :edit
  end
end
