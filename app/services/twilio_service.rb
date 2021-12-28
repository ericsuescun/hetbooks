# frozen_string_literal: true

require 'twilio-ruby'

class TwilioService

  def send_wa_message(wa_msg_params)
    message = nil

    begin
      message = client.messages.create(
                                   from: "whatsapp:+14155238886",
                                   body: "#{wa_msg_params[:message]}",
                                   to: "whatsapp:#{wa_msg_params[:cel_number]}"
                                 )
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end

    message.status
  end

  private

  def account_sid
    @account_sid ||= ENV['ACCOUNT_SID']
  end

  def auth_token
    @auth_token ||= ENV['ACCOUNT_TOKEN']
  end

  def client
    @client ||= Twilio::REST::Client.new(account_sid, auth_token)
  end
end
