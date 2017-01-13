class ProductImage < ApplicationRecord

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  belongs_to :product, required: false
  mount_uploaders :images, ImageUploader





  private
  def crop_image
    images.recreate_versions! if crop_x.present?
  end
  def image_size
    if images.size > 5.megabytes
      errors.add(:image, "上传档案不能大于5MB")
    end
  end
end
