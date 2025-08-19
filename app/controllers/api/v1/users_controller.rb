module V1
    class UsersController < ApplicationController
      def index
        users = User.order(created_at: :desc)
        render json: users.as_json(only: visible_fields)
      end
       def show
            unless params[:id].to_s.match?(/\A\d+\z/)
                render json: { error: "不正なIDです" }, status: :bad_request and return
            end
        user = User.find(params[:id])
        render json: user.as_json(only: visible_fields)
      rescue ActiveRecord::RecordNotFound
        render json: { error: "ユーザーが見つかりません" }, status: :not_found
      end
      private
      def visible_fields
        %i[
          id provider uid username name avatar_url bio location skills last_login_at role created_at updated_at
        ]
      end
    end
  end