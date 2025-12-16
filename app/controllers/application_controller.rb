class ApplicationController < ActionController::Base
  before_action :redirect_if_profile_incomplete

  private

  def redirect_if_profile_incomplete
    return unless user_signed_in?
    return if controller_name == "registrations"
    return if action_name == "edit"

    if current_user.name.blank? || current_user.eiken_level.blank?
      redirect_to edit_user_registration_path,
        notice: "プロフィールを入力してください"
    end
  end
end
