require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => ENV['SESSION_SECRET']
    
    register Sinatra::Flash
  end

  get "/" do
    redirect '/posts'
  end

  helpers do

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      
      if !logged_in?
        flash[:error] = "Please sign in to complete this action!"
        redirect "/login"
      end
      

    end

    def redirect_if_logged_in
      if logged_in?
        flash[:error] = "You are already logged in! \n
        Please logout to login to another account!"
        redirect "/posts"
      end
    end

    def redirect_if_not_authorized
      if current_user != params[:id]
        flash[:error] = "You are not authorized"
        redirect "/posts"
      end
    end
    
  end
end
