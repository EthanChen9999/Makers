class Product < ApplicationRecord
  belongs_to :user
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images

  validates :title, :description, presence: { :message =>  "图纸名称及图纸描述不能为空" }
  validates :product_images, presence: { message: "至少需上传一张图纸图片"}
  validates :title, length: { minimum: 5, message: "图纸名称不得少于5个字" }
  validates :title, length: { maximum: 36, message: "图纸名称不得多于36个字"}
  validates :title, format: { with: /[a-zA-Z0-9]/, message: "图纸名称不能包含特殊字元" }
  validates :description, length: { minimum: 5, message: "图纸描述不得少于5个字"}
  validates :description, length: { maximum: 500, message: "图纸描述不得多于500个字"}
  validates :description, format: { with: /[a-zA-Z0-9]/, message: "图纸描述不能包含特殊字元" }
end
