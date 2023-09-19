class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if params[:user][:password] == params[:user][:password_confirmation]
          if @user.save
            flash[:notice] = 'Account created successfully. You can now log in.'
            redirect_to root_path # Redirect to the root page or any desired page
          else
            # Handle other validation errors
            render :new
          end
        else
          @user.errors.add(:password_confirmation, "doesn't match Password")
          render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
      
end