maintainer       "Thom May"
maintainer_email "thom@may.lt"
license          "Apache-2.0"
description      "A cookbook for copying files"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"
name "copy_file"

%w(el fedora ubuntu debian).each do |os|
  supports os
end

source_url 'https://github.com/thommay/copy_file-cookbook'
issues_url 'https://github.comthommay/copy_file-cookbook/issues'
chef_version '>= 12.9' if respond_to?(:chef_version)
