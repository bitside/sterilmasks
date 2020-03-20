class UserMailer < ApplicationMailer

  def confirmation_email
    @user = params[:user]

    mail(to:@user.email, subject: t('mailer.user.confirmation.subject'))
  end
end
