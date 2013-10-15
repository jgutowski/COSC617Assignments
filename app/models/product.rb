class Product < ActiveRecord::Base
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  attr_accessible :title, :description, :image_url, :price, :inventory, :store_inventory
  validates :title, :description, :image_url, :inventory, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :inventory, uniqueness: false, numericality: {greater_than: 0, message: 'Books available in store only'}
  validates :store_inventory, uniqueness: false
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG OR PNG image'
  }
  
  private 
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
end
