def initialize(*args)
  super
  @action = :copy
end

actions :copy

attribute :path, :kind_of => String, :name_attribute => true
attribute :group, :kind_of => String, :default => "root"
attribute :owner, :kind_of => String, :default => "root"
attribute :mode, :kind_of => String, :default => "0644"
attribute :source, :kind_of => String
