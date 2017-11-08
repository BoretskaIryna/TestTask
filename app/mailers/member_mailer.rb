class MemberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.access_activation.subject
  #
  def access_activation(user, member)
    @user = user
    @member = member

    mail to: user.email, subject: "Access team"
  end
end
