class ProductsController < ApplicationController

  def index

    @products = current_user.products.all
    render layout: false
  end
  def new
    @product = Product.new
    @product.build_drawing
    @product.build_product_image
  end
  def create
    @product = current_user.products.new(product_params)
    if @product.save

      flash[:notice] = '成功新增模型'
      redirect_to action: 'new'
    else
      flash[:notice] = @product.errors.full_messages
      redirect_to members_index_path
    end
  end
  def show
    @product = Product.find(params[:id])
    @maker = User.find(@product.user_id)

  end
  def edit
    @product = Product.find(params[:id])

  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to members_index_path
    else
      render :edit
    end
  end

  def crop
    @image = ProductImage.find(params[:product][:product_images_attributes][:'0'][:id])
    @image.crop_x = params[:product][:product_images_attributes][:'0'][:crop_x]
    @image.crop_y = params[:product][:product_images_attributes][:'0'][:crop_y]
    @image.crop_w = params[:product][:product_images_attributes][:'0'][:crop_w]
    @image.crop_h = params[:product][:product_images_attributes][:'0'][:crop_h]
    @image.save
    redirect_to members_index_path
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to members_index_path
  end

  def get_json
    @drawing = Product.find(params[:id]).drawing.drawing_url.to_s
    @@data = File.read(Rails.root.to_s+"/public"+@drawing)
    respond_to do |format|
      format.json do
        render json: @@data
      end
    end
  end
  private
  def product_params
    params.require(:product).permit(:title, :description, :tags, :print_time, :dimensions, :quantity, drawing_attributes: [:id, :drawing], product_image_attributes: [:id, :crop_x, :crop_y, :crop_w, :crop_h, {images: []}])
  end
end
