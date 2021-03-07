class UsersController < ApplicationController
	before_action :set_user, only: %i[ show edit update ]
	before_action :check_admin, only: %i[ index ] 

	def index 
		@users = User.all 
	end

	def show
	end

	def edit
	end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "user was successfully updated."
    else
      redirect_to @user, notice: @user.errors.full_messages
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:avatar)
    end
end
