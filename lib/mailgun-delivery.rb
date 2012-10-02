module Mailgun

  class DeliveryError < StandardError
  end

  class MimeDelivery

    attr_accessor :settings

    def initialize(settings)
      self.settings = settings
    end

    def deliver!(mail)
      api_key = settings[:api_key]
      api_host = settings[:api_host]
      destinations = settings[:trap_destinations]
      host = settings[:host] || "api.mailgun.net"
      
      body              = Curl::PostField.content("message", mail.encoded)
      body.remote_file  = "message"
      body.content_type = "application/octet-stream"

      data = []
      data << body

      if destinations.blank?
        destinations = mail.destinations
      end

      destinations.each do |destination|
        data << Curl::PostField.content("to", destination)
      end

      curl = Curl::Easy.new("https://api:#{api_key}@#{host}/v2/#{api_host}/messages.mime")
      curl.multipart_form_post = true
      curl.http_post(*data)

      if curl.response_code != 200

        begin
          error = ActiveSupport::JSON.decode(curl.body_str)["message"]
        rescue
          error = "Unknown Mailgun Error"
        end

        raise Mailgun::DeliveryError.new(error)
      end

    end


  end

end

ActionMailer::Base.add_delivery_method :mailgun, Mailgun::MimeDelivery