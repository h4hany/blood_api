require 'twilio-ruby'

module SendConfirmationCode
  def sendCode(phoneNumber, code)
    account_sid =  APP_CONFIG['sms_account_sid']
    auth_token =  APP_CONFIG['sms_auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
    body = {
        body: code,
        from: "+12015146368",
        to: phoneNumber
    }
    @client.messages.create(body)
  end
end