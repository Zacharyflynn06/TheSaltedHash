PostController < ApplicationController

    get '/posts' do
        @notes = Note.All 
        erb: :"notes/index"
    end

    post '/posts' do
        puts params
    end
end