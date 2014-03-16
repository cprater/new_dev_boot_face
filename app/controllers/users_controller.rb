class UsersController < ApplicationController
  def show
  end

	def new
		
		@group = Group.where(id: params[:group_id]).first
		@group.users << current_user
		redirect_to group_path(@group.id)
	end
end
