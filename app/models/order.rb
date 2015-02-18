class Order < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  def accepted?
    self.accepted == true
  end

  def pending?
    self.accepted == nil
  end

  def refused?
    self.accepted == false
  end

end
