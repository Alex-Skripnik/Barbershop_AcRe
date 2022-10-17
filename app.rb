require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
  @barbers = Barber.all
end

get '/' do
  
  erb :index
end

get '/vizit' do
  erb :vizit
end

# спросим Имя, номер телефона и дату, когда придёт клиент.
post '/vizit' do
  
  c = Client.new params[:client]
  c.save

  
  @title = "Thank you!"
  @message = "Уважаемый #{@username}, мы ждём вас #{@datetime} у выбранного парикмахера #{@barber}."

  erb :message
end


