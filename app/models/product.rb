class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many_attached :pictures
  validates :product_name, :product_url, :product_description, :product_tagline, presence: true
  validate :product_image_type
  validate :thumbnail_type
  belongs_to :user
  has_many :votes
  has_many :hunter
  # def product_images(input)
  #   return self.pictures[input].variant(resize: "300x300").processed
  # end
  def voted_by?(user)
    votes.exists?(user: user)
  end

  def hunted_by?(user)
    hunter.exists?(user: user)
  end

  def hunted(product)
    id = Hunter.select(:user_id).where(product_id: product)
    User.where(id: id)
  end

  private

  def thumbnail_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, "must be jpeg or png")
    elsif image.attached? == false
      errors.add(:image, "required")
    end
  end

  def product_image_type
    if pictures.attached? == false
      errors.add(:pictures, "required")
    end
    # pictures.each do |image|
    #   if !image.content_type.in?(%('picture/jpeg picture/png'))
    #     errors.add(:pictures, "needs to be JPEG or png")
    #   end
    # end
  end
end
