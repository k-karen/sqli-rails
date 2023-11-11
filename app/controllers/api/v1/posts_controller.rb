# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :require_login

      # POST /api/v1/posts
      def create
        Post.create!(
          title: params[:title],
          content: params[:content],
          tags: params[:tags],
          user: current_user
        )

        render json: { message: '投稿しました' }, status: :ok
      end

      # GET /api/v1/posts/count_keyword
      # SQLi code
      def count_keyword
        # SQLiされるコード
        count = current_user.posts.where("tags like '%#{params[:keyword]}%'").count
        # SQLi対応
        # count = current_user.posts.where('tags like ?', "%#{params[:keyword]}%").count

        render json: { count: count.to_i }, status: :ok
      end
    end
  end
end
