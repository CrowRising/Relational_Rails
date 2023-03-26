class BarnsController < ApplicationController
  def index
    @barns = Barn.order_by_creation_date
  end

  def show
    @barn = Barn.find(params[:id])
  end

  def new
  end

  def create
    Barn.create(barn_params)
    redirect_to '/barns'
  end

  private 
  def barn_params
    params.permit(:name)
  end

end