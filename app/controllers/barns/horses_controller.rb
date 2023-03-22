module Barns
  class HorsesController < ApplicationController
    def index
      # require 'pry'; binding.pry
     @barn = Barn.find(params[:barn_id])
     @horses = @barn.horses
    end
  end
end