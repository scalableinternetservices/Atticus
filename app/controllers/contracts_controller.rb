class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  # POST /contracts.json
  def create
    # Only companies can create contracts
    if !current_user.is_student
      @contract = Contract.new(contract_params)
      @contract.owner = current_user.id
      current_user.contracts << @contract
      respond_to do |format|
        if @contract.save
          format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
          format.json { render :show, status: :created, location: @contract }
        else
          format.html { render :new }
          format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
          format.html { render :index }
          format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    if current_user.is_student 
         respond_to do |format|
             contract = Contract.find(params[:id])
             if !current_user.contracts.include?(contract)
                 current_user.contracts << contract
                 current_user.save!
                 format.html { redirect_to contract, notice: 'Contract was successfully added to profile.' }
                 format.json {render :show, status: :ok, location: @contract }
             else
                 format.html { redirect_to contract, notice: 'Contract is already saved' }
                 format.json {render :show, status: :ok, location: @contract }
             end
         end
    end 
  end
  
  # choose a user to start contract
  def start
    @contract = Contract.find(params[:id])
    @contract.worker = params[:worker]
    @contract.progress = true
    @contract.save!
    respond_to do |format|
             format.html { redirect_to @contract, notice: 'Contract was successfully assigned.' }
             format.json {render :show, status: :ok, location: @contract }
    end
  end

  # Drop worker/student from contract
  def reset
    @contract = Contract.find(params[:id])
    @contract.progress = false
    @contract.worker = 0;
    @contract.save!
    respond_to do |format|
             format.html { redirect_to @contract, notice: 'Contract worker was successfully dropped.' }
             format.json {render :show, status: :ok, location: @contract }
    end
  end

  # For student to mark as finished
  def finish
   @contract = Contract.find(params[:id])
   @contract.done = true
   @contract.save!
    respond_to do |format|
             format.html { redirect_to @contract, notice: 'Contract worker was successfully finished.' }
             format.json {render :show, status: :ok, location: @contract }
    end
  end

  # For companies to end transaction
  def approve
   @contract = Contract.find(params[:id])
   @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully completed. Payment will be sent via email' }
      format.json { head :no_content }
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      if Contract.where(params[:id]).exists?
          respond_to do |format|
            format.html { redirect_to contracts_url, notice: 'Contract does not exist.' }
            format.json { head :no_content }
          end
      else
         @contract = Contract.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:title, :company, :description, :image_url, :pay)
    end
end
