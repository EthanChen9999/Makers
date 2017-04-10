class Jumbotron < ApplicationRecord
  mount_uploader :bg, ImageUploader
  belongs_to :user
end
