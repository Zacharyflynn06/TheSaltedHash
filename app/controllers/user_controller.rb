class UserController < ApplicationController
    
    #render form to create new account
    get '/signup' do
        erb :'users/new'
    end

    # create session/log a user in

    post '/signup' do
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
    # post '/signup' do
    #     # if params[:user].values.any? {|value| value == ""}
    #     #     redirect '/signup'
    #     # else
    #         if params[:user][:password] == params[:confirm]
    #            user = User.create(params[:user])
    #              if user.valid?
    #                 session["user_id"] = user.id
    #                 redirect '/posts'
    #              end
    #         else
    #             redirect '/signup'
    #         end
    #     # end
    # end

    
end