yum_package 'epel-release' do
  flush_cache :after
end

yum_package 'nginx'

service 'nginx' do
  action %i[enable start]
end
