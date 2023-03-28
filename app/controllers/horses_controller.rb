class HorsesController < ApplicationController
  def index
    @horses = Horse.paid
  end

  def show
    @horse = Horse.find(params[:id])
  end

  def edit
    @horse = Horse.find(params[:id])
  end

  def update
    @horse = Horse.find(params[:id])
    @horse.update(horse_params)
    @horse.save 
    redirect_to "/horses/#{@horse.id}"
  end

  def destroy
   horse = Horse.find(params[:id])
   horse.destroy
    redirect_to '/horses'
  end

  private 
  def horse_params
    params.permit(:name, :breed, :age, :trail_user, :arena_user, :paid)
  end
end