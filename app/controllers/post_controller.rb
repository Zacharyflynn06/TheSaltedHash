class PostController < ApplicationController

    #all posts
    get '/posts' do
        @posts = Post.all 
        erb :"posts/index"
    end

    #new post
    get '/posts/new' do
        redirect_if_not_logged_in
            erb :'posts/new'
    end

    #one post
    get '/posts/:id' do
            @post = Post.find(params[:id])
            erb :"posts/show"
    end

    #edit one post
    get '/posts/:id/edit' do
        redirect_if_not_logged_in
        # redirect_error_if_not_authorized
            @post = Post.find(params[:id])
  
            erb :"posts/edit"
    end

    #create post
    post '/posts' do
        redirect_if_not_logged_in

        # photo = PhotoUploader.create
        # photo.file = params[:post][:photo]
            post = Post.new(
                
                title: params[:post][:title], 
                content: params[:post][:content],
                user_id: session[:user_id],
                
                avatar: params[:post][:photo]
            )
            steps = params[:post][:step].each do |step|
                Step.create(
                    content: step[:content],
                    post_id: post.id
                )
            end

            post.save
            # ingredients = Ingredient.create(
            #     content: params[:post][:ingredients],
            #     post_id: post.id
            # )
            
        binding.pry
        redirect "/posts/#{post.id}"
    end

    patch '/posts/:id' do
        redirect_if_not_logged_in
        #redirect_error_if_not_authorized

        post = Post.find(params[:id])
        post.update(params["post"])
        redirect "/posts/#{post.id}"
    end

    delete '/posts/:id' do
        redirect_if_not_logged_in
        # redirect_error_if_not_authorized
        post = Post.find(params[:id])
        post.delete
        redirect "/posts"
    end
end