user 'media' do
  action :create
  comment "Used for access to the Media Shares"
  uid 1010
  gid "media"
  system true
  shell "/bin/false"
end
