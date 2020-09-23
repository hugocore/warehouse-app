require 'rails_helper'

RSpec.describe Variant, type: :model do
  subject(:variant) { create :variant, product: product, sku: sku, quantity: quantity }

  let(:product) { create :product }
  let(:sku) { 'BG-101' }
  let(:quantity) { 7 }

  it { is_expected.to have_attributes(sku: sku) }
  it { is_expected.to have_attributes(quantity: quantity) }

  context 'without sku' do
    let(:sku) {}

    it 'raises a validation error' do
      expect { variant }.to raise_error ActiveRecord::RecordInvalid, /Sku can't be blank/
    end
  end

  context 'with a negative quantity' do
    let(:quantity) { -30 }

    it 'raises a validation error' do
      expect { variant }.to raise_error ActiveRecord::RecordInvalid, /must be greater than 0/
    end
  end

  context 'with an invalid quantity' do
    let(:quantity) { 'many' }

    it 'raises a validation error' do
      expect { variant }.to raise_error ActiveRecord::RecordInvalid, /Quantity is not a number/
    end
  end

  context 'without a quantity' do
    let(:quantity) {}

    it 'raises a validation error' do
      expect { variant }.to raise_error ActiveRecord::RecordInvalid, /Quantity can't be blank/
    end
  end

  context 'with a duplicated sku' do
    before { create :variant, product: product, sku: sku, quantity: quantity }

    it 'raises a validation error' do
      expect { variant }.to raise_error ActiveRecord::RecordInvalid, /Sku has already been taken/
    end
  end
end
