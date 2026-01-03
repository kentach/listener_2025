class VocabulariesController < ApplicationController
    def level
    # level パラメータをビュー用にセット
    @level = params[:level]

    # level で絞り込み
    @vocabularies = Vocabulary.where(level: @level)

    # q があれば検索
    if params[:q].present?
        query = params[:q].downcase
        @vocabularies = @vocabularies.where(
        "LOWER(english) LIKE ? OR LOWER(japanese) LIKE ?",
        "%#{query}%", "%#{query}%"
        )
    end

    # 並び順
    @vocabularies = @vocabularies.order(:series, :number)
    end


# vocabularies_controller.rb
    def memorization
        @vocabularies = Vocabulary.where(series: params[:series], level: params[:level]).order(:number)
    end


end

