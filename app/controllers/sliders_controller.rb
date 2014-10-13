class SlidersController < ApplicationController
  def index
    set_instance_variables('Explain')
  end

  def new
  end

  # Slide新規作成関数
  #
  def create
    logger.error(params)
    @slideinfo = params[:slideinfo]
  end

  def show
    set_instance_variables(params[:title])
  end

  # Slide作成画面でのプレビュー表示関数
  #
  def preview
    render :layout => nil 
    @body = params[:body]
    @body = '[empty]' unless @body
    logger.error("hoge2 #{@body}")
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
