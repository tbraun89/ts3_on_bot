class OverviewController < ApplicationController

  def index
    authorize! :read, :overview
  end

end
