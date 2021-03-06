require 'spec_helper'

describe WarrenIpsum::Base do
  let(:line) { 'actual LOL' }
  let(:data) { WarrenIpsum::Data }

  describe '#generate' do
    subject(:warren_ipsum) { WarrenIpsum::Base.new }

    before do
      allow(data).to receive(:new).and_return(double(:random_line => line))
    end

    it 'generates a line from data with a period at the end' do
      expect(warren_ipsum.generate).to eql('actual LOL.')
    end

    context 'when multiple lines are requested' do
      subject(:warren_ipsum) { WarrenIpsum::Base.new(:lines => 3) }

      it 'generates multiple lines, separated by comma' do
        expect(warren_ipsum.generate).to eql('actual LOL, actual LOL, actual LOL.')
      end
    end
  end
end
