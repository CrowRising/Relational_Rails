class BarnsController < ApplicationController
  def index
    @barns = Barn.all
  end
end