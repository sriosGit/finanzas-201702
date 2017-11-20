class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @member = Member.find(params[:m])
    @type = EntryType.all
    @period = Period.all
    @entry = Entry.new
    @afps = Afp.all
  end

  # GET /entries/1/edit
  def edit
    @member = Member.find(params[:m]);
    @type = EntryType.all
    @period = Period.all
    @afps = Afp.all
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.amount = @entry.amount - get_impuesto(@entry.amount) - get_afp(@entry.afp_id, @entry.amount)
    respond_to do |format|
      
      if @entry.save
        #@impRenta.update(amount: get_impuesto(@entry.id, @entry.amount))
        format.html { redirect_to Member.find(@entry.member_id), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    member_id = @entry.member_id
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to Member.find(member_id), notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:member_id, :amount, :entry_type, :detail, :period, :afp_id)
    end

    def get_impuesto(amount)
      uit=4050.00;
      sueldo=amount
      rentaNetaAnual = 0.00
      impuestoRenta = 0.00

      rentaNetaAnual=(sueldo*14)-(7*uit);
      rentaUit = 0;
      rentaUit=rentaNetaAnual/uit;
      if rentaUit<0 || rentaUit==0
        impuestoRenta=0
      elsif rentaUit < 5
        impuestoRenta=sueldo*0.08
      elsif rentaUit>=5 && rentaUit<20
        aux=rentaNetaAnual-20250
        impuestoRenta=((20250*0.08)+(aux*0.14))/12
      elsif rentaUit>20 && rentaUit<35
        aux=rentaNetaAnual-81000;
        impuestoRenta=(((20250*0.08)+((81000-20250)*0.14)+(aux*0.17)))/12
      elsif rentaUit>=35 && rentaUit<45
        aux=rentaNetaAnual-182000;
        impuestoRenta=((20250*0.08)+((81000-20250)*0.14)+((141750-81000)*0.17)+((182000-141750)*0.2)+(aux*0.3))/12
      end
      impuestoRenta
    end

    def get_afp(afp_id, amount)
      afp = amount * Afp.find(afp_id).rate/100
      afp
    end
end
