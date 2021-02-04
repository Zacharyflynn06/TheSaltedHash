class SessionController < ApplicationController


    #login + 
    get '/login' do
        erb :'sessions/new'
    end

    # create session/log a user in
	post "/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/success"
		else
			redirect "failure"
		end
	end

    #logout
    delete '/logout' do
        sessions.delete
    end
    
end