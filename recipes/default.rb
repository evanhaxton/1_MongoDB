#
# Cookbook:: 1_MongoDB
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# optimization for mongo client
template '/etc/init.d/disable-transparent-hugepages' do
  source 'disable-transparent-hugepages.erb'
  mode 0755
  owner 'root'
end

# add the script to chkconfig
service 'disable-transparent-hugepages' do
  action [:enable, :start]
end

# download mongodb-org
template '/etc/yum.repos.d/mongodb-org-3.6.repo' do
  source 'mongodb-org-3.6.repo.erb'
  mode 0644
end

# install package
package 'mongodb-org'

# enable the process to automatically start
service 'mongod' do
  action [:enable, :start]
end

# add admin user to mongo client
template '/home/vagrant/mongo-add-admin-user.js' do
  source 'mongo-add-admin-user.js.erb'
  mode 0644
  owner 'root'
end

# execute add user command
execute 'mongo' do
  command '/usr/bin/mongo < /home/vagrant/mongo-add-admin-user.js'
end

# enable user authorization
template '/etc/mongod.conf' do
  source 'mongod.conf.erb'
  mode 0644
end
