class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/new'
    end

    # create session/log a user in
    post '/signup' do
        binding.pry
        if params[:user].values.any? {|value| value == ""}
            redirect '/signup'
        else
            if params[:user][:password] == params[:confirm]
                User.create(params[:user])
                redirect '/login'
            else
                redirect '/signup'
            end
        end
    end


end