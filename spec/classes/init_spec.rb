require 'spec_helper'
describe 'thttpd' do
  context 'with defaults for all parameters' do
    let (:facts) { { :osfamily => 'Gentoo' } }
    it { should contain_class('thttpd') }
    it { should contain_package('thttpd').with_ensure('2.26.4-r3') }
    it { should contain_file_line('thttpd document root').with_line('THTTPD_DOCROOT="/var/www/localhost"') }
    it { should contain_file('thttpd config file').that_notifies('Service[thttpd]') }
    it { should contain_service('thttpd').with_provider('openrc') }
  end
end
