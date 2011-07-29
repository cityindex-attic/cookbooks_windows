# Fetch the manifest
ciapi_in_a_box_svn "Export (fetch) the manifest" do
  svn_username @node[:ciapi_in_a_box][:svn_username]
  svn_password @node[:ciapi_in_a_box][:svn_password]
  svn_root @node[:ciapi_in_a_box][:svn_manifest_url]
  output_directory @node[:ciapi_in_a_box][:install_dir]  
  
  action :export
end

# parse the manifest
@node[:ciapi_in_a_box][:svn_username][:manifest] = JSON.parse(IO.read(File.expand_path(File.join(@node[:ciapi_in_a_box][:install_dir], File.basename(@node[:ciapi_in_a_box][:svn_manifest_url]))))
