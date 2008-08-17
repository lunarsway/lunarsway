require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

ActionMailer::Base.smtp_settings = {
:address => 'smtp.gmail.com',
:port => 587,
:domain => 'lunarsway.com',
:authentication => :plain,
:user_name => 'info@lunarsway.com',
:password => 'fattoush'
}