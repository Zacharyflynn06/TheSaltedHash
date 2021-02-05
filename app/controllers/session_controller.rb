class SessionController < ApplicationController


    #login form
    get '/login' do
        erb :'sessions/new'
    end

    # create session/
    # log a user in
	post "/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/posts"
		else
			redirect "/login"
		end
	end

    #logout
    get '/logout' do
        session.clear
        redirect '/'
    end
    
end