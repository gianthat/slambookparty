class UsersController < ApplicationController
	  before_action :set_user
	  after_action :verify_authorized


  def homeroom 
  end

  def show
  end

  def edit
	  @pen_colors = User::PEN_COLORS
  end

  def update
  	@pen_colors = User::PEN_COLORS
    # failure
      if @user.update(user_params)
          redirect_to @user, notice: 'Update successful!'
      else
        render :edit, notice: "User was not updated"
      end
  end

  private

  	def set_user
      if params.has_key?(:id)
        @user = User.find(params[:id])
      else 
        @user = current_user
      end
  	  	authorize @user
  	end

  	def user_params
  		params.require(:user).permit(:email, :first_name, :last_name, :admin, :pen_color,  :password, :password_confirmation)
  	end

end
