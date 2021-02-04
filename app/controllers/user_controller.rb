class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/new'
    end

    # create session/log a user in
    post '/signup' do
        puts params

        if params[:user].values.any? {|value| value == ""}
            redirect '/failure'
        else
            if params[:user][:password] == params[:confirm]
                # User.create(params[:user])
                puts "YAY"
                redirect '/login'
            else
                redirect '/failure'
            end
        end

    end
end