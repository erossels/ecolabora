require 'sendgrid-ruby'
include SendGrid
require 'json'

class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy cancel_purchase end_purchase ]
  before_action :authenticate_user!

  # GET /Purchases or /Purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /Purchases/1 or /Purchases/1.json
  def show
    @chat = Chat.find_by(purchase_id: @purchase.id)
  end

  # GET /Purchases/1/edit
  def edit
  end

  # POST /Purchases or /Purchases.json
  def create
    @purchase = Purchase.new
    @purchase.status = 0
    @purchase.user_id = current_user.id
    @purchase.product_id = params[:product_id]
    
    respond_to do |format|
      if @purchase.save
        @product = Product.find(params[:product_id])
        @product.update_status(1)

        send_email_after_purchase(current_user, @product.user_id)

        @chat = Chat.create!(purchase_id: @purchase.id)

        format.html { redirect_to @purchase, notice: "Este producto es tuyo. Contáctate con el dueño a través del un mensaje. Sigamos revalorizando <3" }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { redirect_to root_path, alert: "¡Ups! Algo salió mal"}
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: "purchase was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    product = Product.find(@purchase.product_id)
    product.update_status(0)

    @chat = Chat.find_by(purchase_id: @purchase.id)
    if !@chat.nil?
      @chat.destroy
    end

    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "No hay problema. Ya encontrarás algo" }
      format.json { head :no_content }
    end
  end

  def cancel_purchase
    @purchase.update_status(1)
    product = Product.find(@purchase.product_id)
    product.update_status(0)
    
    redirect_to @purchase, alert: "La entrega fue cancelada por el dueño del producto"

  end

  def end_purchase  
    @purchase.update_status(2)

    redirect_to @purchase, notice: "Han revalorizado un producto.¡Felicitaciones!"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:user_id, :product_id, :status)
    end

    def send_email_after_purchase(buyer_user, owner_user_id)
      # using SendGrid's Ruby Library
      # https://github.com/sendgrid/sendgrid-ruby

      data = JSON.parse('{
        "personalizations": [
          {
            "to": [
              {
                "email": "erossel@kyklos.cl"
              }
            ],
            "subject": "Sending with Twilio SendGrid is Fun"
          }
        ],
        "from": {
          "email": "eduardorossel@outlook.cl"
        },
        "content": [
          {
            "type": "text/plain",
            "value": "and easy to do anywhere, even with Ruby"
          }
        ]
      }')
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._("send").post(request_body: data)
      puts response.status_code
      puts response.body
      puts response.headers
      puts response
    end

end
