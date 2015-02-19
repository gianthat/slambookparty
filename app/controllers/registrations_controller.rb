class RegistrationsController < Devise::RegistrationsController

	def edit
		@pen_colors = User::PEN_COLORS
	end

protected

    def after_update_path_for(resource)
      homeroom_user_path(resource)
    end

end