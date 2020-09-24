class HomepageController < ApplicationController
  def show
    @products = Product.kept.order(:created_at)
  end
end
