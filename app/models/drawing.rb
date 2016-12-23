class Drawing < ApplicationRecord
  mount_uploader :drawing, DrawingUploader
  belongs_to :product, required: false
  validates_presence_of :drawing
end
