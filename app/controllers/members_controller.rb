class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /members
  # GET /members.json
  def index
  
      @members = Member.where(user_id: current_user.id)

  end

  # GET /members/1
  # GET /members/1.json
  def show
    @outcome = Entry.where(entry_type: [2,4,5], member_id: params[:id])
    @income = Entry.where(entry_type: [1,3], member_id: params[:id])
    #@actual_van = get_van(params)
  end

  # GET /members/new
  def new
    @member = Member.new
    @relations = Relation.all
  end

  # GET /members/1/edit
  def edit
    @relations = Relation.all
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @member.user_id = current_user.id
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :relation, :user_id)
    end

    def get_van(params)
      #n = params[:n] || Date.today.month
      #sueldo = Entry.where(member_id: params[:member_id], entry_type: 'sueldo').sum(:amount)
      #income = Entry.where(member_id: params[:member_id], entry_type: 'ingreso').sum(:amount)
      #outcome = Entry.where(member_id: params[:member_id], entry_type: 'egreso').sum(:amount)

      #sumIncome = 0
      #if sueldo.nil? && income.nil? && outcome.nil?      
      #  for i in 1..n
      #    sumIncome += sueldo/((1+sueldo.tem)^i)
      #  end
      #  van = sumIncome - income + income
      #end
    end
end
