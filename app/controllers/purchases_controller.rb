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
        @product.status = 1
        @product.save

        @chat = Chat.create(purchase_id: @purchase.id)

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
    product.status = 0
    product.save

    @chat = Chat.find_by(purchase_id: @purchase.id)
    @chat.destroy

    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "No hay problema. Ya encontrarás algo" }
      format.json { head :no_content }
    end
  end

  def cancel_purchase
    @purchase.status = 1
    product = Product.find(@purchase.product_id)
    product.status = 0
    product.save
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, alert: "La entrega fue cancelada por el dueño del producto" }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def end_purchase
    @purchase.status = 2
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: "Han revalorizado un producto.¡Felicitaciones!" }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
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
end
