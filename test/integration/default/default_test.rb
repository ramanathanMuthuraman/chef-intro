describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe directory('/opt/app/') do
  it { should exist }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
end

describe file('/opt/app/api.json') do
  it { should exist }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should cmp '0644' }
end

describe json('/opt/app/api.json') do 
  its(['foo']) { should eq 'foo-value-override' }
  its(['bar']) { should eq 'bar-value' }
end

describe directory('/etc/nginx/default.d') do
  it { should exist }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
end

describe file('/etc/nginx/default.d/app.conf') do
  it { should exist }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should cmp '0644' }
end

describe http('http://localhost/api') do
  its('status') { should cmp 200 }
  its('body') { should include('foo-value-override') }
end