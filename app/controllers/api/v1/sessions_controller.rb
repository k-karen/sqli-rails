# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      # POST /api/v1/users/activate
      def activate
        if User.load_from_activation_token(params[:token])&.activate!
          render json: { message: '有効化しました' }, status: :ok
        else        
          render json: { error: :not_authenticated }, status: :unauthorized
        end
      end

      # POST /api/v1/users/sign_up
      def sign_up
        @user = User.new(email: params[:email], password: params[:password])
        if @user.save
          # HACKME: activation_tokenを返したらなんの意味もないけど、スクリプトを書くのが面倒なので返す。
          render json: { message: 'アカウントを作成しました', token: @user.activation_token }, status: :ok
        else
          render json: { error: 'error!' }, status: :unprocessable_entity
        end
      end

      # POST /api/v1/users/login
      def sign_in
        if @user = login(params[:email], params[:password])
          render json: { message: 'ログインしました' }, status: :ok
        else        
          render json: { error: :not_authenticated }, status: :unauthorized
        end
      end

      # DELETE /api/v1/users/logout
      def logout
        logout
        render json: { message: 'ログアウトしました' }, status: :ok
      end

      # POST /api/v1/users/request_password_reset
      def request_password_reset
        if @user = User.find_by(email: params[:email])
          @user.deliver_reset_password_instructions!
          render json: { message: 'パスワードリセットのメールを送信しました' }, status: :ok
        else        
          render json: { error: :not_authenticated }, status: :unauthorized
        end
      end

      # POST /api/v1/users/password_reset
      def password_reset
        if @user = User.load_from_reset_password_token(params[:token])
          if @user.change_password!(params[:password])
            render json: { message: 'パスワードを変更しました' }, status: :ok
          else
            render json: { error: 'error!' }, status: :unprocessable_entity
          end
        else        
          render json: { error: :not_authenticated }, status: :unauthorized
        end
      end

      def me
        render json: { id: current_user.id }, status: :ok
      end
    end
  end
end
