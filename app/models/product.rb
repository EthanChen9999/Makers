class Product < ApplicationRecord
  belongs_to :user
  has_one :product_image, dependent: :destroy
  has_one :drawing, dependent: :destroy
  accepts_nested_attributes_for :product_image
  accepts_nested_attributes_for :drawing

  validates :product_image, presence: { message: "必须上传至少一张图片"}
  validates :title, :description, presence: { :message =>  "图纸名称及图纸描述不能为空" }

  validates :title, length: { minimum: 5, message: "图纸名称不得少于5个字" }
  validates :title, length: { maximum: 36, message: "图纸名称不得多于36个字"}

  validates :description, length: { minimum: 5, message: "图纸描述不得少于5个字"}
  validates :description, length: { maximum: 10000, message: "图纸描述不得多于500个字"}

  searchable do
    text :title, :description
  end

end
