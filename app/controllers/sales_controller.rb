class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /Sales or /Sales.json
  def index
    @Sales = Sale.all
  end

  # GET /Sales/1 or /Sales/1.json
  def show
  end

  # GET /Sales/new
  def new
    @sale = Sale.new
  end

  # GET /Sales/1/edit
  def edit
  end

  # POST /Sales or /Sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: "sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Sales/1 or /Sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: "sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Sales/1 or /Sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to Sales_url, notice: "sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:user_id, :product_id, :status)
    end
end
