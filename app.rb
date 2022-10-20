require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :barber, presence: true
  validates :color, presence: true
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
  if c.save 
      @title = "Thank you!"
      @message = "Уважаемый #{@username}, мы ждём вас #{@datetime} у выбранного парикмахера #{@barber}."

      erb :message
  else
    @error = c.errors.full_messages.first
    erb :vizit
  end
end


