class ChangeProductImagesImageType < ActiveRecord::Migration[5.0]
  def up
    remove_column :product_images, :image
    add_column :product_images, :images, :json
  end
  def down
    remove_column :product_images, :images
    add_column :product_images, :image, :string
  end
end
