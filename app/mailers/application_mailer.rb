class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDGRID_USERNAME']
end
