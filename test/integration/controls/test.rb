include_controls 'nginx-baseline' do
  # skip entropy test, as our short living test VMs usually do not
  # have enough
  skip_control 'nginx-14'
  skip_control 'nginx-16'
end
