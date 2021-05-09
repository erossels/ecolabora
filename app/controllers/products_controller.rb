class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_categories
  before_action :authenticate_user!

  # GET /products or /products.json
  def index
    if params[:search].present?
      @products = Product.with_attached_photos.all.where("name iLIKE (?) OR description iLIKE (?)", "%"+params[:search]+"%", "%"+params[:search]+"%").order(created_at: :desc)
    else
      @products = Product.with_attached_photos.all.order(created_at: :desc)
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.status = 0
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Has creado un producto. Ojalá encuentre un nuevo hogar pronto :)" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Información actualizada" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Has borrado el producto." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:category_id, :user_id, :name, :description, :r_action, :status, :search, photos: [])
    end

    def set_categories
      @categories = Category.all
    end 
end
