class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates_presence_of :user_id, :image, messange: "不能为空值"
end
