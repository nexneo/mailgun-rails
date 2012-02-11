require "action_mailer"
require "active_support"
require "curb"
require "mailgun-delivery"

module MailgunExtensions
  def mailgun_tag(tag)    
    headers['X-Mailgun-Tag'] = tag      
  end
end

ActionMailer::Base.send(:include, MailgunExtensions)