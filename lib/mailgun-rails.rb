require "action_mailer"
require "active_support"
require "curb"
require "mailgun-delivery"

 module ActionMailer
  class Base
    def mailgun_tag(tag)    
      @_message['X-Mailgun-Tag'] = tag      
    end      
  end  
end