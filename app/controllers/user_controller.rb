class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/signup'
    end

    get '/users' do
        @users = User.all
        erb :'users/index'
    end

    get '/users/:id' do
        # redirect_if_not_logged_in
      
            @user = User.find(params[:id])
            erb :"users/show"
    end

    get '/users/:id/edit' do
        redirect_if_not_logged_in
            @user = User.find(params[:id])
  
            erb :"users/edit"
    end
    

    # create session/log a user in
    post '/signup' do
        
        user = User.new(params[:user])
        if user.valid?
            #flash[:success] = "Success"
            user.save
            session["user_id"] = user.id
            redirect "/users/#{user.id}"
        else
            #flash[:error] = "Something went wrong"
            redirect '/signup'
        end
    end

    patch '/users/:id' do
        redirect_if_not_logged_in
        #redirect_error_if_not_authorized
        
        # binding.pry
        user = User.find(params[:id])
        uploader = PhotoUploader.new
        uploader.store!(params[:user][:avatar])
        user.update(params[:user])
        # binding.pry
        redirect "/users/#{user.id}"
    end

    
end