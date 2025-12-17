# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def update_profile
    before_level = current_user.eiken_level

    if current_user.update(profile_params)
      # 英検級が変更され、かつ「上がった」場合
      if before_level.present? &&
        before_level != current_user.eiken_level &&
        eiken_level_up?(before_level, current_user.eiken_level)

        redirect_to profile_path,
                    notice: "#{current_user.name}さん、#{current_user.eiken_level}合格おめでとうございます！🎉"
      else
        redirect_to profile_path,
                    notice: "プロフィールを更新しました"
      end
    else
      render "devise/registrations/edit",
            status: :unprocessable_entity
    end
  end
  
  private

def profile_params
  params.require(:user).permit(:name, :eiken_level)
end

def eiken_level_up?(before, after)
  levels = [
    "まだ取得していない",
    "英検5級",
    "英検4級",
    "英検3級",
    "英検準2級",
    "英検準2プラス級",
    "英検2級",
    "英検準1級",
    "英検1級"
  ]

  levels.index(after) > levels.index(before)
end

end
