class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
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
    end
end
