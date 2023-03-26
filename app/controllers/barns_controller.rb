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
    Barn.create(name: params[:name])
    redirect_to '/barns'
  end

end