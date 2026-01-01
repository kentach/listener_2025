class TextbooksController < ApplicationController
  def show
    @textbook = Textbook.find(params[:id])
    @chapters = @textbook.chapters.includes(:audios)

    @tabs =
      case @textbook.series
      when "音トレ"
        ["長文", "リスニング"]
      when "リズマス"
        ["フレーズ", "リスニング問題にチャレンジ"]
      else
        @chapters.pluck(:series).uniq
      end
  end
end