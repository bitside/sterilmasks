class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:show, :destroy]

  # GET /consumers
  # GET /consumers.json
  def index
    if params[:search].present?
      @consumers = Consumer.search(params[:search])
    else
      @consumers = Consumer.all
    end
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

    respond_to do |format|
      if @consumer.save
        format.html { redirect_to @consumer, notice: 'Consumer was successfully created.' }
        format.json { render :show, status: :created, location: @consumer }
      else
        format.html { render :new }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumers/1
  # DELETE /consumers/1.json
  def destroy
    @consumer.destroy
    respond_to do |format|
      format.html { redirect_to consumers_url, notice: 'Consumer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_email
    respond_to do |format|
      if @consumer.confirm(params[:confirmation_token])
        format.html { redirect_to @consumer, notice: 'Successfully confirmed' }
      else
        format.html { redirect_to '/', alert: 'Could not be confirmed!' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer
      @consumer = Consumer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consumer_params
      params.require(:consumer).permit(:name, :description, :phone, :email, :street, :postal_code, :city)
    end
end
