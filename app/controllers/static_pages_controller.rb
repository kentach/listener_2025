class StaticPagesController < ApplicationController
    def top
        @ontore_textbooks = Textbook.where(series: "音トレ")
        @rhythm_textbooks = Textbook.where(series: "リズムでマスター")
    end 
end
