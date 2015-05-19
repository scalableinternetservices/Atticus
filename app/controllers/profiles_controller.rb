class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  autocomplete :skill_tag, :name

  # GET /profiles
  # GET /profiles.json
  def index
    @user = User.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(set_profile)
  end

  # GET /profiles/new
  def new
  end

  # GET /profiles/1/edit
  def update
    @user = User.find(params[:id])
      respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to root_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end 
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def edit
    @user = User.find(params[:id])
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   def profile_params
    params.require(:user).permit(:name, :email, :password, :first_name, :last_name, :corporation, :school, :image_url, :profile, :linkedin_url, :github_url, :personal_website, :company_website)
   end

end
