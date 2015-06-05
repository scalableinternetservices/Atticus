class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  autocomplete :skill_tag, :name

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
   
    if stale?([Contract.all, Comment.all, User.all])
      @contracts = Contract.all.page(params[:page]).per(15)
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
      fresh_when([@contract, @contract.skill_tags, @contract.comments, @contract.users])
  end

  # GET /contracts/new
  def new
    
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

      #skills
      
        result = params[:skill_tag_name].split(",")
        result.each do |k|
          skill = SkillTag.find_by_name(k)
          @contract.skill_tags << skill
          @contract.save!
        end
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

     result = params[:skill_tag_name].split(",")
        result.each do |k|
          skill = SkillTag.find_by_name(k)
          @contract.skill_tags << skill
          @contract.save!
        end

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
		 company = User.find(contract.owner)
		 #send email to company to notify pending
		 #Larrymailer.contract_pending(current_user, company, contract).deliver_now
      #   company.has_notifications = true
      #   notification = Notification.new
      #   notification.sender = current_user
      #   notification.recipient = company
      #   notification.subject = "#{current_user.first_name} has added your contract!"
      #   notification.contract = contract
      #   notification.body = "#{current_user.first_name} has signaled interest in your contract #{contract.title}."
      #   company.notifications_as_recipient << notification
      #   company.save!
      #   current_user.notifications_as_sender << notification
      #   contract.notifications << notification
      #   contract.save!
                 current_user.contracts << contract
                 current_user.save!
      #           notification.save!
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
    worker = User.find(@contract.worker)
    #send email to user to note contract accepted
    #Larrymailer.contract_accepted(worker, @contract).deliver_now
         worker.has_notifications = true
         notification = Notification.new
         notification.sender = current_user
         notification.recipient = worker
         notification.subject = "#{current_user.corporation} has designated you for #{@contract.title}!"
         notification.contract = @contract
         notification.body = "#{current_user.corporation} has assigned you to work for #{@contract.title}!"
         worker.notifications_as_recipient << notification
         worker.save!
         current_user.notifications_as_sender << notification
         @contract.notifications << notification
         @contract.save!
                 current_user.save!
                 notification.save!
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
    worker = User.find(@contract.worker)
    #send email to user to note contract accepted
    #Larrymailer.contract_accepted(worker, @contract).deliver_now
         worker.has_notifications = true
         notification = Notification.new
         notification.sender = current_user
         notification.recipient = worker
         notification.subject = "#{current_user.corporation} has dropped you from #{@contract.title}!"
         notification.contract = @contract
         notification.body = "#{current_user.corporation} has dropped you to from for #{@contract.title}! You can contact him at #{current_user.email} "
         worker.notifications_as_recipient << notification
         worker.save!
         current_user.notifications_as_sender << notification
         @contract.notifications << notification
         @contract.save!
                 current_user.save!
                 notification.save!
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
    company = User.find(@contract.owner)
    #email company that user has finished work
    #Larrymailer.contract_finished(current_user, company, @contract).deliver_now
         company.has_notifications = true
         notification = Notification.new
         notification.sender = current_user
         notification.recipient = company
         notification.subject = "#{current_user.first_name} has finished your contract!"
         notification.contract = @contract
         notification.body = "#{current_user.first_name} has marked the contract #{@contract.title} done. Please approve it on the contract page."
         company.notifications_as_recipient << notification
         company.save!
         current_user.notifications_as_sender << notification
         @contract.notifications << notification
         @contract.save!
                 current_user.save!
                 notification.save!
    @contract.done = true
    @contract.save!
    respond_to do |format|
             format.html { redirect_to @contract, notice: 'Contract was successfully submitted.' }
             format.json {render :show, status: :ok, location: @contract }
    end
  end

  # For companies to end transaction
  def approve
    @contract = Contract.find(params[:id])
    user = User.find(@contract.worker)
    #send worker email that he will get payed for his approved work
    #Larrymailer.contract_approved(user, @contract).deliver_now
         user.has_notifications = true
         notification = Notification.new
         notification.sender = current_user
         notification.recipient = user
         notification.subject = "#{current_user.corporation} has approved your work for  #{@contract.title}!"
         notification.contract = @contract
         notification.body = "#{current_user.corporation} has approved your work for #{@contract.title}! Your payment will be deposited shortly."
         user.notifications_as_recipient << notification
         user.save!
         current_user.notifications_as_sender << notification
         @contract.notifications << notification
         @contract.save!
                 current_user.save!
                 notification.save!
    @contract.approved = true
    @contract.save!
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
  
  # search
  def search
                if params[:search]
                          @contracts = Contract.search(params[:search]).order("created_at DESC").page(params[:page]).per(15)
                else
                          @contracts = Contract.all.order("created_at DESC").page(params[:page]).per(15)
                end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
         @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:title, :company, :description, :image_url, :pay, :picture)
    end
end
