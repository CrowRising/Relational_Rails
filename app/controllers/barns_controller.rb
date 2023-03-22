class BarnsController < ApplicationController
  def index
    @barns = Barn.all
  end

  def show
    @barn = Barn.find(params[:id])
  end
end