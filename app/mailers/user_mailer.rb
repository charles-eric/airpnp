class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
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
