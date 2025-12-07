class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_audio, except: :index

  def index
    # ユーザーがいいねした音声一覧を取得
    @grouped = current_user
              .favorited_audios
              .includes(chapter: :textbook)
              .group_by { |audio| audio.chapter.textbook }
              .transform_values do |audios|
                audios.group_by(&:chapter)
              end
  end

  def create
    @audio.favorites.create(user: current_user)
    current_user.favorites.find_or_create_by(audio: @audio)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back fallback_location: root_path }
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(audio: @audio)
    favorite&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back fallback_location: root_path }
    end
  end



  private

  def set_audio
    @audio = Audio.find(params[:audio_id])
  end
end