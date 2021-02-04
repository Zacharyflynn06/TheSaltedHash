require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "TheSaltedHash" # ENV['SESSION_SECRET']
  end

  get "/" do
    "hello World"
  end

end
