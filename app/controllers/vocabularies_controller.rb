class VocabulariesController < ApplicationController

    def level
        @level = params[:level]

        @vocabularies = Vocabulary.where(level: @level)

        if params[:q].present?
        q = params[:q].strip
        @vocabularies = @vocabularies.where(
            "english ILIKE ? OR japanese ILIKE ?",
            "%#{q}%",
            "%#{q}%"
        )
        end

        @vocabularies = @vocabularies.order(:series, :number)

        respond_to do |format|
        format.html
        format.turbo_stream
        end
    end


    def memorization
        @vocabularies =
        Vocabulary.where(series: params[:series], level: params[:level])
                    .order(:number)
    end
end
