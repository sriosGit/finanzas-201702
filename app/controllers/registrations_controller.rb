class RegistrationsController < Devise::RegistrationsController


	def new
		@rates = Rate.all
	end

	private

	def sign_up_params
		params.require(:user).permit(:email, :password, :password_confirmation, :rate)
	end

	def sign_up_params
		params.require(:user).permit(:email, :password, :password_confirmation, :rate, :current_password)
	end
end