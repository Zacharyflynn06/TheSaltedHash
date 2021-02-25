class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/signup'
    end

    get '/users' do
        @users = User.all.order('RANDOM()')
        erb :'users/index'
    end

    get '/users/:id' do      
        @user = User.find(params[:id])
        erb :"users/show"
    end

    get '/users/:id/edit' do

        redirect_if_not_logged_in

        @user = User.find(params[:id])

        redirect_if_not_authorized(@user.id)

        erb :"users/edit"
    end
    

    # create session/log a user in
    post '/signup' do
        
        user = User.new(params[:user])
        if user.valid?
            flash[:success] = "Success, Thank you for signing up!"
            user.save
            session["user_id"] = user.id
            redirect "/users/#{user.id}"
        else
            flash[:error] = user.errors.full_messages.to_sentence
            redirect '/signup'
        end
    end

    patch '/users/:id' do

        user = User.find(params[:id])

        if params[:user][:avatar]
            uploader = PhotoUploader.new
            uploader.store!(params[:user][:avatar])
        end

        user.update(
            
            first_name: params[:user][:first_name],
            last_name: params[:user][:last_name],
            username: params[:user][:username],
            email: params[:user][:email],
            bio: params[:user][:bio],
            avatar: uploader || user.avatar
        )
 
        redirect "/users/#{user.id}"
    end

    delete '/users/:id' do
        redirect_if_not_logged_in
        
        user = User.find(params[:id])

        if current_user.id != user.id
            redirect_if_not_authorized
        end

        user.delete
        redirect "/"
    end

end