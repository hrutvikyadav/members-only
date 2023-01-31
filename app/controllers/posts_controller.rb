class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(title: params[:post][:title] , body: params[:post][:body] , user_id: current_user.id)
        if @post.save
            redirect_to posts_url
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

end
