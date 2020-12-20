module Api
  class PostsController < ApplicationController
    def index
      posts = Post.all
      render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
    end
  end
end
