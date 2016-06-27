class Product < ApplicationRecord
  # Test if something has changed since last rendering
  def self.latest
    Product.order(:updated_at).last
  end

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\Z}i,
    message:  'must be a URL for GIF, JPG, or PNG image.'
  }
end
