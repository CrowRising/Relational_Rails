module Barns
  class HorsesController < ApplicationController
    def index
     @barn = Barn.find(params[:id])
     @horses = @barn.sort_by_name(params[:sort])
    end

    def new
    end

    def create
     @barn = Barn.find(params[:id])
     @barn.horses.create(horse_params)
     redirect_to "/barns/#{@barn.id}/horses"
    end

    private
    def horse_params
      params.permit(:name)
    end

  end
end