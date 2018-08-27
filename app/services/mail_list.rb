# frozen_string_literal: true

class MailList
  def self.sign_up(params)
    new(params).sign_up
  end

  private_class_method :new
  def initialize(params)
    @params = params
    @connection = Faraday.new(url: 'https://us18.api.mailchimp.com') do |faraday|
      faraday.response :logger
      faraday.basic_auth(
        'api_key',
        Rails.application.credentials[:mail_chimp_api_key]
      )
      faraday.adapter Faraday.default_adapter
    end
  end

  def sign_up
    @connection.post(
      "/3.0/lists/#{Rails.application.credentials[:mail_chimp_mail_list_id]}/members",
      {
        email_address: @params[:email],
        status: 'subscribed',
        merge_fields: { FNAME: @params[:first_name], LNAME: @params[:last_name] }
      }.to_json
    )
  end
end
