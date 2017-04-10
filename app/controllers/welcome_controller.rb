class WelcomeController < ApplicationController
  def index

    if params[:query]
      @products
    else
      @products = Product.page(params[:page]).per(25)
    end
  end
  def language
    l = params[:locale].to_s.strip.to_sym
    l = I18n.default_locale unless I18n.available_locales.include?(l)
    cookies.permanent[:user_locale] = l
    if request.env["HTTP_REFERER"].present?
      redirect_to :back
    else
      redirect_to '/'
    end
  end
  def search
    traditional = Product.search do
      str = params[:query]
      traditional = Ropencc.conv('s2t.json', str)
      keywords traditional
    end.results
    simplified = Product.search do
      str = params[:query]
      simplified = Ropencc.conv('t2s.json', str)
      keywords simplified
    end.results
    @products = traditional | simplified

    respond_to do |format|
      format.html {render action: "index"}
      format.xml {render xml: @products}
    end
  end
end
