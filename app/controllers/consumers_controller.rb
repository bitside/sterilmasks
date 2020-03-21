class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]

  # GET /consumers
  # GET /consumers.json
  def index
    @consumers = Consumer.confirmed.search(params[:search])
  end

  # GET /consumers/1
  # GET /consumers/1.json
  def show
  end

  # GET /consumers/new
  def new
    @consumer = Consumer.new
  end

  # POST /consumers
  # POST /consumers.json
  def create
    @consumer = Consumer.new(consumer_params)

    if @consumer.save
      redirect_to @consumer, notice: t('messages.user.profile_created')
    else
      render :new
    end
  end

  # GET /changes/1/edit
  def edit
    authorize! @consumer
  end

  # PATCH/PUT /changes/1
  # PATCH/PUT /changes/1.json
  def update
    authorize! @consumer

    if @consumer.update(change_params)
      redirect_to @consumer, notice: t('messages.user.profile_updated')
    else
      render :edit
    end
  end

  # DELETE /consumers/1
  # DELETE /consumers/1.json
  def destroy
    authorize! @consumer

    @consumer.destroy

    redirect_to root_url, notice: t('messages.user.profile_deleted')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer
      @consumer = Consumer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consumer_params
      params.require(:consumer).permit(:name, :description, :phone, :email, :street, :postal_code, :city, :terms_of_service, services: [])
    end

    def change_params
      params.require(:consumer).permit(:name, :description, :phone, :street, :postal_code, :city, services: [])
    end
end
