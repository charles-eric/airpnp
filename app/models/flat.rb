class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  accepts_nested_attributes_for :orders

   has_attached_file :picture,
    styles: { medium: "500x500>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/


  def self.search(query)
  where("city like ?", "%#{query}%")
  end


end

#ADD VALIDATE IMAGE OBLIGATOIR
