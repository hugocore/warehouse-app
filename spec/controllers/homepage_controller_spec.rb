require 'rails_helper'

RSpec.describe HomepageController, type: :request do
  describe 'GET show' do
    let!(:product1) { create :product, title: 'Product1' }
    let!(:product2) { create :product, title: 'Product2' }

    before do
      get '/'
    end

    it 'responds with a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the latest product' do
      expect(response.body).to include(product2.title)
    end

    it 'shows the first product' do
      expect(response.body).to include(product1.title)
    end
  end
end
