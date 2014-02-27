actions :install, :remove

attribute :package, :kind_of => String, :required => true
attribute :build, :kind_of => String, :required => true
attribute :release, :kind_of => String, :required => true
attribute :lifecycle, :kind_of => String, :default => 'stable'
attribute :repository, :kind_of => String, :default => 'bcs'