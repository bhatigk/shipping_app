class ShipmentsController < ApplicationController
  before_action :set_shipment, only: %i(show edit update destroy)

  # GET /shipment or /shipment.json
  def index
    @shipments = Shipment.all
  end

  # GET /shipment/1 or /shipment/1.json
  def show; end

  # GET /shipment/new
  def new
    @shipment = Shipment.new
    authorize @shipment
  end

  # GET /shipment/1/edit
  def edit
    authorize @shipment
  end

  # POST /shipment or /shipment.json
  def create
    @shipment = Shipment.new(shipment_params)
    authorize @shipment

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to shipment_url(@shipment), notice: "shipment was successfully created." }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipment/1 or /shipment/1.json
  def update
    authorize @shipment

    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to shipment_url(@shipment), notice: "shipment was successfully updated." }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipment/1 or /shipment/1.json
  def destroy
    authorize @shipment

    @shipment.destroy

    respond_to do |format|
      format.html { redirect_to shipment_url, notice: "shipment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shipment_params
    params.require(:shipment).permit(:package_id, :customer_id, :delivery_partner_id, :status, source_location: %i(street_address city state zip_code), target_location: %i(street_address city state zip_code))
  end
end
