class DeliveryPartnersController < ApplicationController
  before_action :set_delivery_partner, only: %i(show edit update destroy)

  # GET /delivery_partners or /delivery_partners.json
  def index
    @delivery_partners = DeliveryPartner.all
  end

  # GET /delivery_partners/1 or /delivery_partners/1.json
  def show; end

  # GET /delivery_partners/new
  def new
    @delivery_partner = DeliveryPartner.new
  end

  # GET /delivery_partners/1/edit
  def edit; end

  # POST /delivery_partners or /delivery_partners.json
  def create
    @delivery_partner = DeliveryPartner.new(delivery_partner_params)

    respond_to do |format|
      if @delivery_partner.save
        format.html { redirect_to delivery_partner_url(@delivery_partner), notice: "delivery_partner was successfully created." }
        format.json { render :show, status: :created, location: @delivery_partner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delivery_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_partners/1 or /delivery_partners/1.json
  def update
    respond_to do |format|
      if @delivery_partner.update(delivery_partner_params)
        format.html { redirect_to delivery_partner_url(@delivery_partner), notice: "delivery_partner was successfully updated." }
        format.json { render :show, status: :ok, location: @delivery_partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @delivery_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_partners/1 or /delivery_partners/1.json
  def destroy
    @delivery_partner.destroy

    respond_to do |format|
      format.html { redirect_to delivery_partners_url, notice: "delivery_partner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_delivery_partner
    @delivery_partner = DeliveryPartner.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def delivery_partner_params
    params.require(:delivery_partner).permit(:username, :company_name, :phone_number, :email, :password)
  end
end
