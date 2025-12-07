class AudiosController < ApplicationController
    def show
        @textbook = Textbook.find(params[:textbook_id])
        @chapter = @textbook.chapters.find(params[:chapter_id])
        @audio = @chapter.audios.find(params[:id])
    end
end
