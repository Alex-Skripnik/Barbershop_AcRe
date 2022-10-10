require 'rubygems'
require 'sinatra'

get '/' do
  erb 'Can you handle a <a href="/secure/place">secret</a>?'
end

