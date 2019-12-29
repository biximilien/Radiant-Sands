class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [ :index, :show, :edit, :update, :destroy ]

  expose(:users) { User.order('name ASC') }

  expose(:user, attributes: :user_params) do
    unless params[:id].nil?
      User.find(params[:id])
    else
      User.new
    end
  end

  def create
    self.user = User.new(user_params)

    respond_to do |format|
      if user.save
        format.html { redirect_to user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: user }
      else
        format.html { render :new }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if user.update(user_params)
        format.html { redirect_to user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: user }
      else
        format.html { render :edit }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
