require '/tmp/kitchen/spec/spec_helper.rb'

def log_files
  %w(/var/log/nginx/error.log /var/log/nginx/access.log)
end

describe file('/etc/nginx/conf.d/default.conf') do
  it { should_not exist }
end

describe file('/etc/nginx/conf.d/custom.conf') do
  it { should exist }
end

describe command('curl http://localhost') do
  its(:exit_status) { should eq 0 }
end
