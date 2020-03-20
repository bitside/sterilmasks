class UsersController < ApplicationController
  before_action :set_user, only: [:confirm_email]


  def confirm_email
    respond_to do |format|
      if @user.try_confirm(params[:confirmation_token])
        format.html { redirect_to @user, notice: 'Successfully confirmed' }
      else
        format.html { redirect_to '/', alert: 'Could not be confirmed!' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
