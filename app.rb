require 'sinatra'
require 'mandrill'

get '/' do
  erb :home
end

get '/menu' do
  erb :menu
end

get '/contact' do
  erb :contact
end

post '/post' do
	m = Mandrill::API.new
	message = {
		:subject => "Greetings from Rocket Fuel!",
		:from_name => "Rocket Fuel Coffee Co.",
		:text => "Thanks for visiting our website!  We will be in contact with you shortly. :)",
		:to => [
			{
				:email => "recipient@theirdomain.com",
				:name => "Recipient1"
			}
		],
		:html => "<html><h1>Hello, thanks for visitng Rocket Fuel Coffee!</h1></html>",
		:from_email => "sender@yourdomain.com"
	}
	sending = m.messages.send message
	puts sending
	erb :post
end
