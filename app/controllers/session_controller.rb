class SessionController < ApplicationController


    #login + 
    get '/login' do
        erb :'sessions/new'
    end

    # create session/log a user in
    post '/login' do

    end

    #logout
    delete '/logout' do

    end
    
end