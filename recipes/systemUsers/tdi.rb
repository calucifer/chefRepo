user 'tdi' do
  action :create
  comment "Test Driven Infrastructure"
  home "/home/tdi"
  supports :manage_home => true
end

template '/home/tdi/.tdi' do
	action :create
	source 'bogus'
end


