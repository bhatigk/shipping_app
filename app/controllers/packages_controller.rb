class PackagesController < ApplicationController
  before_action :set_package, only: %i(show edit update destroy)

  # GET /packages or /packages.json
  def index
    @packages = Package.includes(:shipment).where(shipment: { id: nil }).order(created_at: :asc)
  end

  # GET /packages/1 or /packages/1.json
  def show; end

  # GET /packages/new
  def new
    @package = Package.new
    authorize @package
  end

  # GET /packages/1/edit
  def edit
    authorize @package
  end

  # POST /packages or /packages.json
  def create
    @package = Package.new(package_params)
    authorize @package

    respond_to do |format|
      if @package.save
        format.html { redirect_to package_url(@package), notice: "package was successfully created." }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1 or /packages/1.json
  def update
    authorize @package

    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to package_url(@package), notice: "package was successfully updated." }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1 or /packages/1.json
  def destroy
    authorize @package

    @package.destroy

    respond_to do |format|
      format.html { redirect_to packages_url, notice: "package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_package
    @package = Package.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def package_params
    params.require(:package).permit(:package_name, :description, :weight, :status)
  end
end
