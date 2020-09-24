class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
    @product.variants.build
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to edit_product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.discard!
    redirect_to homepage_path, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params
      .fetch(:product, {})
      .permit(:title, :description, variants_attributes: [ :id, :sku, :quantity, :_destroy ])
  end
end
