class VocabulariesController < ApplicationController
    def index
        @vocabularies = Vocabulary.all
    end

    def memorization
        @vocabularies = Vocabulary.all
    end
end

