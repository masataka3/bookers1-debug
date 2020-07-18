class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
  end
end

   def update
    @user = Uers.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "youer succsece"
    else render :edit
   end
 end

private
    def user_params
       params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def zipedit
      params.require(:user).permit(:postcode, :prefecture_name, :address_city, :address_street, :address_building)
    end

    def screen_user
      unless params[:id].to_i == current_user.id
        redirect_to user_path(current_user)
      end
    end

end