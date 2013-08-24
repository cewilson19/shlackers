class CategoriesController < ApplicationController
	before_action :require_user
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name))
   		
		if @category.save
			flash[:notice] = "New Category"
			redirect_to root_path
		else
			render :new
		end
		
	end
end