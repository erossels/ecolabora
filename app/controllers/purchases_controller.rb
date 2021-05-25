require 'sendgrid-ruby'
include SendGrid
require 'json'

class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy cancel_purchase end_purchase ]
  before_action :authenticate_user!
  before_action :banned?

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

    send_email_after_cancelling(current_user, @product.user_id)

  end

  def end_purchase  
    @purchase.update_status(2)

    redirect_to @purchase, notice: "Han revalorizado un producto.¡Felicitaciones!"

    send_email_after_success(current_user, @product.user_id)

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
      from = SendGrid::Email.new(email: 'eduardorossel@outlook.cl')
      to = SendGrid::Email.new(email: User.find(owner_user_id).email)
      subject = 'Has adquirido un producto'
      content = SendGrid::Content.new(type: 'text/plain', value: 'Alguien necesita uno de tus productos, ponte en contacto con el ingresando a Ecolabora')
      mail = SendGrid::Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

    def send_email_after_cancelling(buyer_user, owner_user_id)
      from = SendGrid::Email.new(email: 'eduardorossel@outlook.cl')
      to = SendGrid::Email.new(email: buyer_user.email)
      subject = 'Han cancelado tu orden'
      content = SendGrid::Content.new(type: 'text/plain', value: 'El dueño de este producto ha cancelado esta entrega.')
      mail = SendGrid::Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

    def send_email_after_success(buyer_user, owner_user_id)
      from = SendGrid::Email.new(email: 'eduardorossel@outlook.cl')
      to = SendGrid::Email.new(email: buyer_user.email)
      subject = 'Felicitaciones! Has ecolaborado para construir un mundo más sustentable.'
      content = SendGrid::Content.new(type: 'text/plain', value: 'Has concretado una entrega. Si no es así, contáctaté con nosotros.')
      mail = SendGrid::Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

end
