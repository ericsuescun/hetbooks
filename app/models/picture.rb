class Picture < ApplicationRecord
  belongs_to :book

  mount_uploader :image, PictureUploader

  validate  :image_size

  private

    # Validates the size of an uploaded picture.
    def image_size
      if image.size > 10.megabytes
        errors.add(:image, "Debe ser menor a 10MB")
      end
    end
end
