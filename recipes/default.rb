yum_package 'epel-release' do
  flush_cache :after
end

yum_package 'nginx'

service 'nginx' do
  action %i[enable start]
end

directory '/opt/app' do
  owner 'root'
  group 'root'
end

file '/opt/app/api.json' do
  owner 'root'
  group 'root'
  mode '0644'
end

template '/opt/app/api.json' do
  source 'api.json.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/nginx/default.d/app.conf' do
  source 'app.conf'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[nginx]'
end