control 'check gcloud sdk' do
  impact 1.0
  title 'confirm gcloud sdk installed'
  desc 'confirm gcloud sdk installed'
  describe file('/google-cloud-sdk/bin/gcloud') do
    it { should exist }
  end
  describe command('gcloud version') do
    its('stdout') { should include '255.0.0' }
  end
end

control 'check kubectl' do
  impact 1.0
  title 'confirm kubectl installed'
  desc 'confirm kubectl installed'
  describe file('/google-cloud-sdk/bin/kubectl') do
    it { should exist }
  end
  describe command('kubectl version') do
    its('stdout') { should include '1.12.9' }
  end
end

control 'check git' do
  impact 1.0
  title 'confirm git installed'
  desc 'confirm git installed'
  describe command('git version') do
    its('stdout') { should include '2.20.1' }
  end
end

control 'check openssl' do
  impact 1.0
  title 'confirm openssl installed'
  desc 'confirm openssl installed'
  describe command('openssl version') do
    its('stdout') { should include '1.1.1b' }
  end
end

control 'check gpg' do
  impact 1.0
  title 'confirm gpg installed'
  desc 'confirm gpg installed'
  describe command('gpg --help') do
    its('stdout') { should include '2.2.12' }
  end
end

control 'check docker' do
  impact 1.0
  title 'confirm docker installed'
  desc 'confirm docker installed'
  describe command('docker --version') do
    its('stdout') { should include '19.03' }
  end
end

control 'check terraform' do
  impact 1.0
  title 'confirm terraform installed'
  desc 'confirm terraform installed'
  describe command('terraform --version') do
    its('stdout') { should include '0.12' }
  end
end