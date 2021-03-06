class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.all
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
  end

  # GET /lots/new
  def new
    @lot = Lot.new
    3.times { @lot.lot_details.build }
  end

  # GET /lots/1/edit
  def edit
  end

  # Post 
  def edit_with_details
   
  end


  # POST /lots
  # POST /lots.json
  def create
     @lot = Lot.new(lot_params)

     respond_to do |format|
       if @lot.save
          @prodcut = Product.new
          @prodcut.lot = @lot
          @prodcut.save!
          format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
          format.json { render :show, status: :created, location: @lot }
       else
          format.html { render :new }
          format.json { render json: @lot.errors, status: :unprocessable_entity }
       end
     end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:dte, :turn_id, :producer_id, :city_id, :troop_number, :cargo_date, :expiration_date , :transport_id, :seal_number, :liveweight, :quantity_control, :close_code, :arrival_date, :arrival_time, lot_details_attributes: [:id, :animal_id, :quantity, :observation])
    end
end
