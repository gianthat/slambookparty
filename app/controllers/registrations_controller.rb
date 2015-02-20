class RegistrationsController < Devise::RegistrationsController

	def edit
		@pen_colors = User::PEN_COLORS
	end

protected

    def after_update_path_for(resource)
      homeroom_user_path(resource)
    end

    def update_resource(resource, params)
	  resource.update_without_password(params)
	end

end