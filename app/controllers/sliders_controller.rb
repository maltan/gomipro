class SlidersController < ApplicationController
  def index
    @projects = Slider.all
  end
end
