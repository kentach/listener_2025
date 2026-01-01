class StaticPagesController < ApplicationController
    def top
        @ontore_textbooks = Textbook.where(series: "音トレ")
        @rhythm_textbooks = Textbook.where(series: "リズマス")
    end 

    def about; end
    def feature; end
    def profile; end
end
