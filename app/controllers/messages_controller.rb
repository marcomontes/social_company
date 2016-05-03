class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :menu_data

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)

    if message_params[:group_ids].reject(&:empty?).any? && @message.save
      redirect_to root_path, notice: 'Message publicado correctamente.'
    else
      flash[:message] = "Debe seleccionar por lo menos un grupo" unless message_params[:group_ids].reject(&:empty?).any?
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :category_id, :visibility, :body, group_ids: [])
    end

    def menu_data
      @groups = Group.all
      @categories = Category.all
    end
end
