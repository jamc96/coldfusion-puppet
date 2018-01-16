require 'spec_helper'
describe 'coldfusion' do
  context 'with default values for all parameters' do
    it { should contain_class('coldfusion') }
  end
end
