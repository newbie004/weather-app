class HomeController < ApplicationController
    def index
        user_id = session[:user_id]
        @user = User.find_by(id: user_id) if user_id
    end
end