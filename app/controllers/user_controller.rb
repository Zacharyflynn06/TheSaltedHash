class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/signup'
    end

    get '/users' do
        @users = User.all
        erb :'users/index'
    end


    #user home page
    get '/users/:id/home' do
        redirect_if_not_logged_in
            @user = User.find(session["user_id"])
            @user_posts = @user.posts
            erb :"users/home"  
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        
            @user = User.find(params[:id])
            erb :"users/show"
    end
    

    # create session/log a user in
    post '/signup' do
        user = User.create(params[:user])
        if user.valid?
            #flash[:success] = "Success"
            session["user_id"] = user.id
            redirect '/users/home'
        else
            #flash[:error] = "Something went wrong"
            redirect '/signup'
        end
    end

    
end