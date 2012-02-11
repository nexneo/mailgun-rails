require "action_mailer"
require "active_support"
require "curb"
require "mailgun-delivery"

module MailgunExtensions
  def mailgun_tag(tag)    
    headers['X-Mailgun-Tag'] = tag      
  end
  
  def mailgun_vars(val)
    headers['X-Mailgun-Variables'] = JSON.fast_generate(val)
  end
end

ActionMailer::Base.send(:include, MailgunExtensions)