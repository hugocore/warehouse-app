require 'rails_helper'

RSpec.describe HomepageController, type: :request do
  describe 'GET show' do
    let!(:product1) { create :product }
    let!(:product2) { create :product }
    let!(:product3) { create :product }

    before do
      get '/'
    end

    it 'responds with a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the latest products' do
      expect(response.body).to include(product3.title)
      expect(response.body).to include(product2.title)
      expect(response.body).to include(product1.title)
    end
  end
end
