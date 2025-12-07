class TextbooksController < ApplicationController
    def show
        @textbook = Textbook.find(params[:id])
        @chapters = @textbook.chapters.includes(:audios)
    end
end
