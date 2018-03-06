require 'spec_helper'

describe Administrate::Field::Money do
  subject { described_class.new(:money, data, :show) }

  describe '#to_partial_path' do
    let(:data) { 1000 }

    it 'returns a partial based on the page being rendered' do
      path = subject.to_partial_path
      expect(path).to eq('/fields/money/show')
    end
  end
end
