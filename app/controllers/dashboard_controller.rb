class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.for_user_dashboard(current_user)
  end

end
