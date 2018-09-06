require 'spec_helper'
require 'money'

describe Administrate::Field::Money do
  subject { described_class.new(:money, data, :show) }

  let(:data) { 1000 }
  let(:options) { {} }

  before { allow(subject).to receive(:options).and_return(options) }

  describe '#to_partial_path' do
    it 'returns a partial based on the page being rendered' do
      path = subject.to_partial_path
      expect(path).to eq('/fields/money/show')
    end
  end

  describe '#money' do
    let(:output) { subject.money }

    it 'returns a Money object with default values' do
      expect(output).to be_a(Money)
      expect(output.fractional).to eq 1000
      expect(output.currency).to eq 'USD'
    end
  end

  describe '#to_s' do
    let(:output) { subject.to_s }

    context 'with nil' do
      let(:data) { nil }

      it 'returns a formatted, zero amount in the default currency' do
        expect(output).to eq '$0.00'
      end
    end

    context 'with a value' do
      let(:data) { 199 }

      it 'returns the formatted amount in the default currency' do
        expect(output).to eq '$1.99'
      end

      it 'returns the formatted amount with the selected symbol' do
        allow(subject).to receive(:symbol).and_return('€')
        expect(output).to eq '€1.99'
      end

      it 'returns the formatted amount without a symbol' do
        allow(subject).to receive(:symbol).and_return(nil)
        expect(output).to eq '1.99'
      end
    end
  end

  describe '#code' do
    let(:output) { subject.code }

    context 'with nil' do
      it 'returns USD' do
        expect(output).to eq 'USD'
      end
    end

    context 'with a valid option' do
      let(:options) { { code: 'EUR' } }

      it 'returns the value' do
        expect(output).to eq 'EUR'
      end
    end
  end

  describe '#symbol' do
    let(:output) { subject.symbol }

    context 'with nil' do
      it 'returns $' do
        expect(output).to eq '$'
      end
    end

    context 'with a valid option' do
      let(:options) { { symbol: '¥' } }

      it 'returns the value' do
        expect(output).to eq '¥'
      end
    end
  end

  describe '#delimiter' do
    let(:output) { subject.delimiter }

    context 'with nil' do
      it 'returns a comma' do
        expect(output).to eq ','
      end
    end

    context 'with a valid option' do
      let(:options) { { delimiter: '.' } }

      it 'returns the value' do
        expect(output).to eq '.'
      end
    end
  end

  describe '#separator' do
    let(:output) { subject.separator }

    context 'with nil' do
      it 'returns a dot' do
        expect(output).to eq '.'
      end
    end

    context 'with a valid option' do
      let(:options) { { separator: ',' } }

      it 'returns the value' do
        expect(output).to eq ','
      end
    end
  end
end
