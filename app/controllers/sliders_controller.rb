class SlidersController < ApplicationController
  def index
    set_instance_variables('Explain')
  end

  def new
  end

  def show
    set_instance_variables(params[:title])
  end

  private
  # スライド情報設定関数
  #
  # @param key DBのtitle値
  def set_instance_variables(key)
    target = Slider.find_by(:title => key)
    if target
      @title       = target.title
      @description = target.description
    else
      @title       = "Not Found"
      @description = "Not found slide(title => #{key})."
    end
  end
end
