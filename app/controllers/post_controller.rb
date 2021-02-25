class PostController < ApplicationController

    #all posts
    get '/posts' do
        #@posts = Post.all.order("created_at DESC") 
        @posts = Post.all.order('RANDOM()')
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
        @ingredients = @post.ingredients
        erb :"posts/show"
    end

    #edit one post
    get '/posts/:id/edit' do

        redirect_if_not_logged_in
        
        @post = Post.find(params[:id])
        
        if current_user.id != @post.user_id
            redirect_if_not_authorized
        end

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
                
                i = Ingredient.find_or_create_by(
                    name: ingredient[:name]
                )
                
                IngredientPost.create(
                    ingredient: i, 
                    post: post,
                    amount: ingredient[:amount], 
                    measurement_type: ingredient[:measurement]
                )
            end
        redirect "/posts/#{post.id}"
    end

    #edit post
    patch '/posts/:id' do
        post = Post.find(params[:id])

        if current_user.id != post.user_id
            flash[:error] = "You are not authorized"
            redirect "/posts"
        end

        if params[:post][:avatar]
            uploader = PhotoUploader.new
            uploader.store!(params[:post][:avatar])
        end

        post.update(
            title: params[:post][:title], 
            description: params[:post][:description],
            avatar: uploader || post.avatar
            )
        
        step_counter = 0
        post.steps.each do |step|
            step.update(params[:post][:step][step_counter])
            step_counter += 1
        end

        ingredient_counter = 0
        post.ingredients.each do |ingredient|
            ingredient.update(params[:post][:ingredient][ingredient_counter][:main])
            ingredient_counter += 1
        end

        ingredient_post_counter = 0
        post.ingredient_posts.each do |ip|
            ip.update(params[:post][:ingredient][ingredient_post_counter][:aux])
            ingredient_post_counter += 1
        end

        redirect "/posts/#{post.id}"

            
    end

    #delete post
    delete '/posts/:id' do

        if current_user.id != post.user_id
            flash[:error] = "You are not authorized"
            redirect "/posts"
        end

        redirect_if_not_logged_in
        post = Post.find(params[:id])
        post.delete
        redirect "/posts"
    end
end