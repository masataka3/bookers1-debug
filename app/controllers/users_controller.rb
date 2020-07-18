class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

private

  def user_params
    params.require(:user).permit(:name)
  end
  def zipedit
  params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end
end

