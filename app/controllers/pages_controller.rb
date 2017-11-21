class PagesController < ApplicationController
	def login 
		@user = User.new
		@rates = Rate.all
	end
end
