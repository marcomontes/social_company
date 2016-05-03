class VisitorsController < ApplicationController

  def index
    @public_messages = Message.publics
  end

end
