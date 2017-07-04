include_controls 'nginx-baseline' do
  # skip http method control
  skip_control 'nginx-14'
  # skip HTTPOnly and secure cookie control
  skip_control 'nginx-16'
end
