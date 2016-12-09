class ProductImage < ApplicationRecord

  mount_uploader :image, ImageUploader
  belongs_to :product, required: false

  validate :image_size

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "上传档案不能大于5MB")
    end
  end
end
