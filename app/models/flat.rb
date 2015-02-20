class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :orders, dependent: :destroy
  accepts_nested_attributes_for :orders

  has_attached_file :picture,
                    styles: { large: '500x500>', medium: '250x250>', thumb: '100x100>' }

  validates_attachment_content_type :picture,
                                    content_type: /\Aimage\/.*\z/

  def coordinates
    "#{address} #{city}"
  end

  geocoded_by :coordinates
  after_validation :geocode, if: :coordinates_changed?

  def coordinates_changed?
    address_changed? || city_changed?
  end

  CAPACITY_OPTIONS = (1..15)

  def self.search(city, capacity)
    where('city ILIKE ? and capacity = ?', "%#{city}%", "#{capacity}")
  end
end

# ADD VALIDATE IMAGE
