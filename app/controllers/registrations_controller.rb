class RegistrationsController < Devise::RegistrationsController

	def edit
		@user = User.find(params[:format])
		@pen_colors = User::PEN_COLORS
		authorize @user
	end

protected

    def after_update_path_for(resource)
      user_path(resource)
    end

    def update_resource(resource, params)
	  resource.update_without_password(params)
	end

end