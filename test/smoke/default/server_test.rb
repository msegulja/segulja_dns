# # encoding: utf-8

# Inspec test for recipe segulja_dns::server

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('bind') do
  it { should be_installed }
end

describe package('bind-utils') do
  it { should be_installed }
end

describe service('named') do
  it { should be_running }
  it { should be_enabled }
end

describe file('/etc/named.conf') do
  its('owner') { should eq 'root' }
  its('group') { should eq 'named' }
  its('mode') { should cmp '0640' }
end

describe directory('/etc/named/zones') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'named' }
  its('mode') { should cmp '0770' }
end
