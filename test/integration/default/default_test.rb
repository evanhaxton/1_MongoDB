describe file('/etc/yum.repos.d/mongodb-org-3.6.repo') do
  it { should exist }
  it { should be_readable }
  its('content') { should match 'MongoDB Repository' }
  its('content') { should match '3.6' }
  its('content') { should match 'gpgcheck' }
  its('content') { should match 'enabled' }
  its('content') { should match 'gpgkey' }
end

describe package('mongodb-org') do
  it { should be_installed }
end
