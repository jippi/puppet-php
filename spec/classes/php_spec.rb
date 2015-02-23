require 'spec_helper'

describe 'php', :type => :class do
  it { should compile.with_all_deps }
  it { should contain_class('php') }
  it { should contain_class('php::params') }
end
