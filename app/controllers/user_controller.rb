class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/new'
    end

    # create session/log a user in
    post '/signup' do
        puts params

        User.create(params)

        # if (!params[:user][:email] = "") && (!params[:user][:password] = "") && (params[:user][:password] == params[:confirm])
        #     User.create(username: params[:users][:username])
        # end
    end
end