class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: 'welcome to AirPnP')
  end

  def new_order(order)
    @order = order
    @flat = order.flat
    @owner = order.flat.user
    @user = order.user

    mail(to: @user.email, subject: 'Someone booked your flat')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermailer.owner-validation.subject
  #
  # def owner_validation(User)
  #   @user = user
  #   mail(to: @user.email, subject: 'New order for your flat')
  # end
end
