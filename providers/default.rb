require 'chef/mixin/checksum'
include Chef::Mixin::Checksum

use_inline_resources

def load_current_resource
  @current_resource = Chef::Resource::CopyFile.new(@new_resource.name)
  @current_resource.source(@new_resource.source)

  @checksum = nil
  if ::File.exists? @current_resource.name
    @checksum = checksum(@current_resource.name)
  end
end

def action_copy
  owner = @new_resource.owner
  group = @new_resource.group
  mode = @new_resource.mode

  source = @new_resource.source
  target = @new_resource.name

  if ! @checksum == checksum(source)
    ruby_block "copy file" do
      block do
        ::FileUtils.cp_f source, target
      end
    end
    new_resource.updated_by_last_action(true)
  end

  file target do
    owner owner
    mode mode
    group group
  end

end
