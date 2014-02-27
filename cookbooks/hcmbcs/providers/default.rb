
require 'chef/mixin/shell_out'

include Chef::Mixin::ShellOut


def create_install_check_command(new_resource)
  package = new_resource.package
  build = new_resource.build
  %Q{/opt/bcs/bin/hcmbcs --query-all | grep #{package}-#{build}}
end

def create_install_command(new_resource)
  package = '--package ' + new_resource.package
  build = '--build ' + new_resource.build
  release = '--release ' + new_resource.release
  lifecycle = '--lifecycle ' + new_resource.lifecycle
  repository = '--repository ' + new_resource.repository
  %Q{/opt/bcs/bin/hcmbcs --install #{package} #{lifecycle} #{release} #{build} #{repository}}
end

def create_remove_command(new_resource)
  package = '--package ' + new_resource.package
  build = '--build ' + new_resource.build
  release = '--release ' + new_resource.release
  %Q{/opt/bcs/bin/hcmbcs --remove #{package} #{release} #{build}}
end

def run_command(command)
   log "Running: #{command}"
   shell_out!(command)
end


def install_hcmbcs_package(new_resource)
    run_command(create_install_command(new_resource))
end

def remove_hcmbcs_package(new_resource)
    run_command(create_remove_command(new_resource))
end

def is_installed?(new_resource)
    p = shell_out(create_install_check_command(new_resource))
    return (p.status == 0)
end

action :install do
  converge_by("Installing #{new_resource}") do
    unless is_installed?(new_resource)
      install_hcmbcs_package(new_resource)
    end
  end
end

action :remove do
  converge_by("Removing #{new_resource}") do
    if is_installed?(new_resource)
      remove_hcmbcs_package(new_resource)
    end
  end
end