class UsersController < ApplicationController
  before_action :set_user, only: [:confirm_email, :manage_account]

  def confirm_email
      if confirmed?
        login! @user

        redirect_to @user, notice: t('messages.user.confirmed')
      else
        redirect_to @user, alert: t('messages.user.not_confirmed')
      end
  end

  def manage_account
    if confirmed?
      login! @user

      redirect_to_edit_user @user
    else
      # just redirect to show page
      redirect_to @user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def confirmed?
      @user.try_confirm(params[:confirmation_token])
    end

    def redirect_to_edit_user(user)
      redirect_to user.kind_of?(Provider) ? edit_provider_url(user) : edit_consumer_url(user)
    end
end
