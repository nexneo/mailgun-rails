require "action_mailer"
require "active_support"
require "curb"
require "mailgun-delivery"

module Mailgun
  module Tag
    def mailgun_tag=(tag)
      @_message['X-Mailgun-Tag'] = tag
    end
  end
end

ActionMailer::Base.send(:include, Mailgun::Tag)