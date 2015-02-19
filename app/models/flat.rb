class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  accepts_nested_attributes_for :orders

   has_attached_file :picture,
    styles: { medium: "250x250>", thumb: "100x100>" },
    :default_url => "/images/:styles/missing.png"

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end


  def self.search(query)
  where("city like ?", "%#{query}%")
  end


end

#ADD VALIDATE IMAGE
