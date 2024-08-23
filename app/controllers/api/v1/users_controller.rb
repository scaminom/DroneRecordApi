module Api
  module V1
    class UsersController < ApplicationController
      load_and_authorize_resource

      def index
        users = User.all

        render json: Panko::ArraySerializer.new(
          users, each_serializer: UserSerializer
        ).to_json
      end

      private

      def user_params
        params.require(:user).permit(*User::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
