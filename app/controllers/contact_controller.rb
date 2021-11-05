class ContactController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    contact_client(name, email, message)
  end



  def contact_client(name, email, message)
    from = SendGrid::Email.new(email: 'kimera.acces@gmail.com')
    to = SendGrid::Email.new(email: 'kimera.acces@gmail.com')
    subject = "Consulta de Cliente #{name} responder a #{email}"
    content = SendGrid::Content.new(type: 'text/plain', value: message)
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts "***#{response.inspect}"
    puts response.status_code
    puts response.body
    puts response.headers
  end

  private
  def home_params
    params.require(:home).permit(:name, :email, :message)
  end
end
