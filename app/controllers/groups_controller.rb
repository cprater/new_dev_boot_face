class GroupsController < ApplicationController

	def index
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		current_user.groups << @group
		
		if @group.save
			redirect_to groups_path
		else
			render 'new'
		end
	end

	def show
		@group = Group.where(id: params[:id]).first
	end

	def edit
		@group = Group.where(id: params[:id]).first
	end

	def update
		@group = Group.where(id: params[:id]).first
		if @group.update(params[:group].permit(:name, :description))
			redirect_to group_path
		else
			render 'edit'
		end		
	end

	def destroy
		@group = Group.where(id: params[:id]).first
		@group.destroy
		redirect_to groups_path
	end

private

	def group_params
		params.require(:group).permit(:name, :description, :created_by)
	end

end