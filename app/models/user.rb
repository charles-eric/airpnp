class User < ActiveRecord::Base
  has_many :oders
  has_many :flats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_attached_file :picture,
    styles: { medium: "500x500>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
