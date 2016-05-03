class VisitorsController < ApplicationController

  def index
    @groups = Group.all
    @categories = Category.all
  end

end
