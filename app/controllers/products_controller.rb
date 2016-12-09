class ProductsController < ApplicationController
  layout "nested_application", only: [:index, :new]
  def index
    @products = current_user.products.all
  end
  def new
    @product = Product.new
    5.times { @product.product_images.new }
  end
  def create
    @product = Product.new(product_images_params)
    @product.user_id = current_user.id

    if @product.save
      flash[:notice] = '新增图纸成功'
      redirect_to members_index_path
    else
      @product.valid?
      flash[:notice] = @product.errors.first[1]
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

    if @product.update(product_images_params)
      flash[:notice] = '变更图纸成功'
      redirect_to edit_product_path(@product)
    else
      flash[:notice] = '变更图纸失败'
      redirect_to edit_product_path(@product)
    end
  end
  def add_image
    @add_image = Product.find(params[:id]).product_images.new
    @add_image.save(product_images_params)
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to members_index_path
  end
  def destroy_image
    @image = ProductImage.find(params[:id])
    @image.destroy
    redirect_to members_index_path
  end
  private
  def product_images_params
    params.require(:product).permit(:title, :description, product_images_attributes: [:id, :image])
  end
end
