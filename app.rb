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
		:subject => "website",
		:from_name => "#{params[:name]} #{params[:email]}",
		:text => "#{params[:message]}",
		:to => [
			{
				:email => "rguzman725@gmail.com",
				:name => "rocketfuel"
			}
		],
		:html => "<html><h1>message</h1></html>",
		:from_email => "rguzman725@gmail.com"
	}
	sending = m.messages.send message
	puts sending
	erb :post
end
