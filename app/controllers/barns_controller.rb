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

  def edit
    # require 'pry'; binding.pry
    @barn = Barn.find(params[:id])
  end

  def update
    barn = Barn.find(params[:id])
    barn.update(barn_params)
    barn.save 
    redirect_to "/barns/#{barn.id}"
  end

  def destroy
    barn = Barn.find(params[:id])
    barn.horses.destroy_all
    barn.destroy
    redirect_to '/barns'
  end

  private 
  def barn_params
    params.permit(:name)
  end
end