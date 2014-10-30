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

get '/coffee' do
  erb :coffee

