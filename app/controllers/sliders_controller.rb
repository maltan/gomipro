class SlidersController < ApplicationController
  def index
    set_instance_variables('Explain')
  end

  def new
  end

  # Slide新規作成関数
  #
  def create
    if params[:preview]
      logger.error ("preview")
      @theme = params[:slideinfo][:slide_theme]
      @trans = params[:slideinfo][:slide_trans]
      @body  = params[:slideinfo][:body]
      render :template => 'sliders/preview', :layout => false
    else
      render :partial => 'share/preview', :layout => false
    end
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
