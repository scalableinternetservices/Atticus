class ApplicationMailer < ActionMailer::Base
  default from: "automated@atticus.com"
  layout 'mailer'
end
