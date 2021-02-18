class PostController < ApplicationController

    #all posts
    get '/posts' do
        @posts = Post.all.order("created_at DESC") 
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
            binding.pry
            erb :"posts/show"
    end

    #edit one post
    get '/posts/:id/edit' do
        redirect_if_not_logged_in
        # redirect_error_if_not_authorized
            @post = Post.find(params[:id])
            @post_ingredients = PostIngredients.where(post_id: @post.id)
            binding.pry
            erb :"posts/edit"
    end

    #create post
    post '/posts' do
        redirect_if_not_logged_in
            post = Post.create(
                
                title: params[:post][:title], 
                description: params[:post][:description],
                user_id: session[:user_id],
                avatar: params[:post][:photo]
            )

            steps = params[:post][:step].each do |step|
               Step.create(
                    content: step[:content],
                    post_id: post.id
                )
            end
            
            params[:post][:ingredients].each do |ingredient|
                
                i = Ingredient.find_or_create_by(name: ingredient[:name])
                post.ingredients << i

                ip = IngredientPost.last
                ip.amount = ingredient[:amount]
                ip.measurement_type = ingredient[:measurement]
                ip.save
            end
        redirect "/posts/#{post.id}"
    end

    patch '/posts/:id' do
        redirect_if_not_logged_in
        #redirect_error_if_not_authorized

        post = Post.find(params[:id])

        ingredients = params[:post][:ingredients].each do |ingredient|
            Ingredient.find_by(id: post.id)
        end
        
        binding.pry
        post.update(params[:post])
        redirect "/posts/#{post.id}"
    end

    delete '/posts/:id' do
        redirect_if_not_logged_in
        post = Post.find(params[:id])
        post.delete
        redirect "/posts"
    end
end