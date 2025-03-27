class PagesController < ApplicationController
    before_action :authenticate_user!, only: :profile

    def home
      # @announcements = Announcement.all
    end

    def profile
        @merch_purchased = Sale.where(user_id: current_user.id)
    end
end
