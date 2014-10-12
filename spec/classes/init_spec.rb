require 'spec_helper'
describe 'thttpd' do

  context 'with defaults for all parameters' do
    it { should contain_class('thttpd') }
  end
end
