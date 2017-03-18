require '/tmp/kitchen/spec/spec_helper.rb'

describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end
