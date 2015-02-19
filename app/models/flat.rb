class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  accepts_nested_attributes_for :orders

   has_attached_file :picture,
    styles: { large: "500x500>", medium: "250x250>", thumb: "100x100>" },
    :default_url => "/images/:styles/missing.png"

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

  def self.search(query)
  where("city like ?", "%#{query}%")
  end


end

#ADD VALIDATE IMAGE
