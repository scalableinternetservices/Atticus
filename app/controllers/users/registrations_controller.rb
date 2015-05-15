class Users::RegistrationsController < Devise::RegistrationsController 

  def new 
    super
  end

  def create
    super
  end

  def cancel 
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy 
    super
  end

  def edit_profile
    @user = User.find(current_user)
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      end
  end 

    
  private
 
  def profile_params
    params.require(:user).permit(:first_name, :last_name, :corporation, :school)
  end

 
end
