require '/tmp/kitchen/spec/spec_helper.rb'

def log_files
  %w(/var/log/nginx/error.log /var/log/nginx/access.log)
end

describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

describe command('yum check-update') do
  its(:stdout) { should_not match /^nginx\./ }
end

log_files.each do |file|
  describe file(file) do
    it { should exist }
  end
end

describe command('yum install -y logrotate') do
  its(:exit_status) { should eq 0 }
end

describe command('curl http://localhost') do
  its(:exit_status) { should eq 0 }
end

describe command('curl http://localhost/error') do
  its(:exit_status) { should eq 0 }
end

describe command('logrotate -fv /etc/logrotate.d/nginx') do
  its(:exit_status) { should eq 0 }
end

log_files.each do |file|
  describe file(file) do
    it { should be_mode 644 }
  end

  describe file("#{file}-#{Time.now.strftime('%Y%m%d')}") do
    it { should exist }
  end
end
