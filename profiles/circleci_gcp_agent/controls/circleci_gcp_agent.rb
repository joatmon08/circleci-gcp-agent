control 'check gcloud sdk' do
  impact 1.0
  title 'confirm gcloud sdk installed'
  desc 'confirm gcloud sdk installed'
  describe file('/google-cloud-sdk/bin/gcloud') do
    it { should exist }
  end
  describe command('gcloud version') do
    its('stdout') { should include '225.0.0' }
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
    its('stdout') { should include '1.10.7' }
  end
end

control 'check git' do
  impact 1.0
  title 'confirm git installed'
  desc 'confirm git installed'
  describe command('git version') do
    its('stdout') { should include '2.18.1' }
  end
end

control 'check openssl' do
  impact 1.0
  title 'confirm openssl installed'
  desc 'confirm openssl installed'
  describe command('openssl version') do
    its('stdout') { should include '1.0.2' }
  end
end

control 'check python' do
  impact 1.0
  title 'confirm python installed'
  desc 'confirm python installed'
  describe command('python --version') do
    its('stdout') { should include '3.7.0' }
  end
  describe command('pip --version') do
    its('stdout') { should include '18.1' }
  end
  describe command('pip show jinja2') do
    its('stdout') { should include '2.10' }
  end
  describe command('invoke --version') do
    its('stdout') { should include '1.2.0' }
  end
end