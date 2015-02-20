class Order < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user
  # after_create :send_email_to_owner

  def accepted?
    accepted == true
  end

  def pending?
    accepted.nil?
  end

  def refused?
    accepted == false
  end

  private

  # def send_email_to_owner
  #   UserMailer.new_order(self).deliver
  # end
end
