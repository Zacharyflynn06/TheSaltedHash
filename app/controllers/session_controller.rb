class SessionController < ApplicationController


    #login form
    get '/login' do
        redirect_if_logged_in
        erb :'sessions/new'
    end

    # create session/
    # log a user in
	post "/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
            flash[:success] = "Successfully logged in!"
			redirect "/users/#{user.id}"
		else
            flash[:error] = "Invalid Username or Password"
			redirect "/login"
		end
	end

    #logout
    get '/logout' do
        session.clear
        redirect '/'
    end
    
end