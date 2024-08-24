module Api
  module V1
    class UsersController < ApplicationController
      load_and_authorize_resource

      def index
        users = User.all

        response = Panko::ArraySerializer.new(
          users, each_serializer: UserSerializer, only: {
            instance: %i[id first_name email]
          }
        ).to_a

        render_success_response(data: { users: response })
      end

      private

      def user_params
        params.require(:user).permit(*User::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
