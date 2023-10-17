class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: %i[show edit update destroy]

  def index
    @purchases = Purchase.all
  end

  def show; end

  def new
    @attributes = []
    @purchase = Purchase.new
    @attributes << @purchase
    @categories = current_user.categories
    @attributes << @categories
  end

  def create
    @attributes = []
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    category_id = params[:purchase][:category_id]
    if category_id.present?
      category = Category.find(category_id)
      @purchase.categories << category
    end
    @attributes << @purchase
    @categories = current_user.categories
    @attributes << @categories
    if @purchase.save
      redirect_to category_url(@purchase.categories[0]), notice: 'Purchase was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @attributes = []
    @attributes << @purchase
    @categories = current_user.categories
    @attributes << @categories
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      redirect_to purchases_path
    else
      render 'edit'
    end
  end

  def destroy
    @purchase.destroy
    redirect_to categories_url, notice: 'Purchase was successfully destroyed.'
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end
