class VocabulariesController < ApplicationController
    def index
        # 英検級スライダー画面
    end

    def level
        @level = params[:level]
        if @level.present?
        @vocabularies = Vocabulary.where(level: @level)
        else
        @vocabularies = []
        end
    end

    def memorization
        @vocabularies = Vocabulary.all
    end
end

