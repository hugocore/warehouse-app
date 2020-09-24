class HomepageController < ApplicationController
  def show
    @products = Product.order(:created_at)
  end
end
