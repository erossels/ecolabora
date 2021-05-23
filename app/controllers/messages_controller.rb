require 'sendgrid-ruby'
include SendGrid
require 'json'

class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    buyer = User.find(Purchase.find(Chat.find(message_params[:chat_id]).purchase_id).user_id)
    owner = User.find(Product.find(Purchase.find(Chat.find(message_params[:chat_id]).purchase_id).product_id).user_id)
    email_after_sending_message(buyer, owner)

    respond_to do |format|
      if @message.save
        format.js { render nothing: true}
        format.html { redirect_to Chat.find(message_params[:chat_id]), notice: "Mensaje enviado" }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:chat_id, :user_id, :content)
    end
    
    def email_after_sending_message(buyer, owner)
      #mail to buyer

      from = SendGrid::Email.new(email: 'eduardorossel@outlook.cl')
      to = SendGrid::Email.new(email: buyer.email)
      subject = 'Hay un nuevo mensaje en el muro de tu compra'
      content = SendGrid::Content.new(type: 'text/plain', value: 'Hay un nuevo mensaje en el muro de tu compra')
      mail = SendGrid::Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers

      #mail to owner

      from = SendGrid::Email.new(email: 'eduardorossel@outlook.cl')
      to = SendGrid::Email.new(email: owner.email)
      subject = 'Hay un nuevo mensaje en el muro de tu compra'
      content = SendGrid::Content.new(type: 'text/plain', value: 'Hay un nuevo mensaje en el muro de tu compra')
      mail = SendGrid::Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

end
