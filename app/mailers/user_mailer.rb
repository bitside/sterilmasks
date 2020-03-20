class UserMailer < ApplicationMailer

  def provider_confirmation_email
    @provider = params[:provider]

    mail(to:@provider.email, subject: t('mailer.user.confirmation.subject'))
  end

  def consumer_confirmation_email
    @consumer = params[:consumer]

    mail(to:@consumer.email, subject: t('mailer.user.confirmation.subject'))
  end
end
