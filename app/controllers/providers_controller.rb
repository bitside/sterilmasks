class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.confirmed.search(params[:search])
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

    if @provider.save
      redirect_to @provider, notice: t('messages.user.profile_created')
    else
      render :new
    end
  end

  # GET /changes/1/edit
  def edit
    authorize! @provider
  end

  # PATCH/PUT /changes/1
  # PATCH/PUT /changes/1.json
  def update
    authorize! @provider

    if @provider.update(change_params)
      redirect_to @provider, notice: t('messages.user.profile_updated')
    else
      render :edit
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    authorize! @provider

    @provider.destroy

    redirect_to providers_url, notice: t('messages.user.profile_deleted')
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provider_params
      params.require(:provider).permit(:name, :description, :phone, :email, :street, :postal_code, :city, :privacy)
    end

    def change_params
      params.require(:provider).permit(:name, :description, :phone, :street, :postal_code, :city)
    end
end
