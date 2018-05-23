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

describe file('/etc/selinux/config') do
  it { should exist }
  it { should be_readable }
  its('content') { should match 'permissive' }
end

describe file('/etc/mongod.conf') do
  it { should exist }
  it { should be_readable }
  its('content') { should match 'dbPath' }
end

# optimization for mongo client
describe file('/etc/init.d/disable-transparent-hugepages') do
  it { should exist }

  describe command('chkconfig --list') do
    its('stdout') { should match(/disable-transparent-hugepage /) }
  end
end

# test for user authentication
describe command('mongo') do
  its('stdout') { should_not match(/WARNING: Access control/) }
end
