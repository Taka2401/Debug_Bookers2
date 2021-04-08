class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.greeting.subject
  #
  def greeting
    @greeting = "Hi"

    mail to: "testgoto234@gmail.com"
  end
end
