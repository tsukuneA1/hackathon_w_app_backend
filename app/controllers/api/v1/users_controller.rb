module Api
  module V1
    class UsersController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def index
        users = User.order(created_at: :desc)
        render json: users.map { |u| serialize(u) }
      end

      def show
        user = User.find(params[:id])
        render json: serialize(user)
      end

      private

      def serialize(u)
        {
          id: u.id,
          provider: u.provider,
          uid: u.uid,
          username: u.username,
          name: u.name,
          avatar_url: u.avatar_url,
          last_login_at: u.last_login_at,
          last_login_ip: u.last_login_ip,
          last_login_user_agent: u.last_login_user_agent,
          created_at: u.created_at,
          updated_at: u.updated_at
        }
      end

      def not_found
        render json: { error: "Not Found" }, status: :not_found
      end
    end
  end
end