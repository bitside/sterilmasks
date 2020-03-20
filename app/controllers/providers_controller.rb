class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :destroy, :confirm_email]

  # GET /providers
  # GET /providers.json
  def index
    if params[:search].present?
      @providers = Provider.search(params[:search])
    else
      @providers = Provider.all
    end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_email
    respond_to do |format|
      if @provider.confirm(params[:confirmation_token])
        format.html { redirect_to @provider, notice: 'Successfully confirmed' }
      else
        format.html { redirect_to '/', alert: 'Could not be confirmed!' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provider_params
      params.require(:provider).permit(:name, :description, :phone, :email, :street, :postal_code, :city)
    end
end
