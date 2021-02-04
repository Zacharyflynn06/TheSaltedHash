class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/new'
    end

    # create session/log a user in
    post '/signup' do
        puts params

        User.create(params[:user])

        # if (!params[:user][:email] = "") && (!params[:user][:password] = "") && (params[:user][:password] == params[:confirm])

        # end

        

        # User.create(
        #     username: params[:user][:username], 
        #     password: params[:user][:password],
        #     email: params[:user][:email],
        #     dob: params[:user][:dob])


    end
end