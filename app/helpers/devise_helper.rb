module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages!

    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    if Rails.env.production?
      errors_msg = "errors.messages.not_saved_production"
    else
      errors_msg = "errors.messages.not_saved"
    end
    sentence = I18n.t(errors_msg,
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
    class="close" data-dismiss="alert">×</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
