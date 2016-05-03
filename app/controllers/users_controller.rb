class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user_and_group, only: [:set_group, :remove_group]

  def index
    @users = User.all
  end

  def set_group
    unless @user.groups.include?(@group)
      @user.groups << @group 
      flash[:message] = "#{@user.name} fue asignado al grupo #{@group.name}"
    end
    
    redirect_to users_url
  end

  def remove_group
    @user.groups.delete(@group)
    flash[:message] = "#{@user.name} fue eliminado del grupo #{@group.name}"
    redirect_to users_url
  end

  private

    def find_user_and_group
      @user = User.find(params[:user_id])
      @group = Group.find(params[:group_id])
    end
end
