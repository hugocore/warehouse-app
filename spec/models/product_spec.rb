require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { create :product, title: title, description: description, variants: variants }

  let(:title) { 'Candybar' }
  let(:description) { 'Very yummy!' }
  let(:variants) { build_list :variant, 1 }

  it { is_expected.to have_attributes(title: title) }
  it { is_expected.to have_attributes(description: description) }

  context 'with a long description' do
    let(:description) { Faker::Lorem.characters(number: 301) }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  context 'without a title' do
    let(:title) { '' }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid
    end
  end

  context 'without a description' do
    let(:description) { '' }

    it 'creates the product' do
      expect { product }.to change(Product, :count).by(1)
    end
  end

  context 'without a variant' do
    let(:variants) { [] }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
