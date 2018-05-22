#
# Cookbook:: 1_MongoDB
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template '/etc/yum.repos.d/mongodb-org-3.6.repo' do
  source 'mongodb-org-3.6.repo.erb'
  mode 0644
end

package 'mongodb-org'
