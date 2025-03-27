class PagesController < ApplicationController
    before_action :authenticate_user!, except: :home
    before_action :authorize_csa_user, only: :user_list

    def home
      # @announcements = Announcement.all
    end

    def profile
        @merch_purchased = Sale.where(user_id: current_user.id)
    end

    def user_list
        @all_users = User.all
    end

    private

    def authorize_csa_user
        unless current_user.username == "csa"
        redirect_to root_path, alert: "You are not authorized to access this page."
        end
    end
end
