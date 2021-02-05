class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/signup'
    end

    # create session/log a user in
    post '/signup' do
        binding.pry
        user = User.create(params[:user])
        puts params
        if user.valid?
            flash[:success] = "Success"
            session["user_id"] = user.id
            redirect '/posts'
        else
            flash[:error] = "Something went wrong"
            redirect '/signup'
        end
    end

    
end