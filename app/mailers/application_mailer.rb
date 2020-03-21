class ApplicationMailer < ActionMailer::Base
  default from: 'accounts@gemeinsamaerztenhelfen.de'
  
  layout 'mailer'
end
