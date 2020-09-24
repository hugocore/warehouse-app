require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { create :product, title: title, description: description, variants: variants }

  let(:title) { 'Candybar' }
  let(:description) { 'Very yummy!' }
  let(:variants) { build_list :variant, 1 }

  it { is_expected.to have_attributes(title: title) }
  it { is_expected.to have_attributes(description: description) }
  it { is_expected.to have_attributes(variants: variants) }

  context 'with a long description' do
    let(:description) { Faker::Lorem.characters(number: 301) }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid, /Description is too long/
    end
  end

  context 'without a title' do
    let(:title) { '' }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid, /Title can't be blank/
    end
  end

  context 'without a description' do
    let(:description) { '' }

    it 'creates the product' do
      expect { product }.to change(described_class, :count).by(1)
    end
  end

  context 'without a variant' do
    let(:variants) { [] }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid, /Variants can't be blank/
    end
  end

  context 'with a duplicated product' do
    before { create :product, title: title, description: description, variants: variants }

    it 'raises a validation error' do
      expect { product }.to raise_error ActiveRecord::RecordInvalid, /Title has already been taken/
    end
  end

  context 'when an old product is soft deleted' do
    before do
      old_product = create :product, title: title, description: description, variants: variants

      old_product.discard!
    end

    it 'allows for a new product to be created' do
      expect { product }.to change(described_class, :count).by(1)
    end
  end
end
