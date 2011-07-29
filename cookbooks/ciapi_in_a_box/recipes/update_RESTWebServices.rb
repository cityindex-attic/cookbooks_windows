include_recipe 'ciapi_in_a_box::update_manifest'

ciapi_in_a_box_svn "Export (fetch) the RESTWebservices binaries from SVN" do
  svn_username @node[:ciapi_in_a_box][:svn_username]
  svn_password @node[:ciapi_in_a_box][:svn_password]
  svn_root @node[:ciapi_in_a_box][:svn_manifest_url]
  output_directory File.expand_path(File.join(@node[:ciapi_in_a_box][:install_dir], 'RESTWebServices')) 
  
  action :export
end

ciapi_in_a_box_archive "Unzip the binaries" do
  archive_path File.expand_path(File.join(@node[:ciapi_in_a_box][:install_dir], 'RESTWebServices', @node[:ciapi_in_a_box][:manifest]['RESTWebServices']['Version'] + '.7z')) 
  output_directory File.expand_path(File.join(@node[:ciapi_in_a_box][:install_dir], 'RESTWebServices', @node[:ciapi_in_a_box][:manifest]['RESTWebServices']['Version'] )) 
  
  action :unzip
end

ciapi_in_a_box_directory "Change the current symlink" do
  link_path File.expand_path(File.join(@node[:ciapi_in_a_box][:install_dir], 'RESTWebServices', 'current')) 
  target_path File.expand_path(File.join(@node[:ciapi_in_a_box][:install_dir], 'RESTWebServices', @node[:ciapi_in_a_box][:manifest]['RESTWebServices']['Version'] )) 
  
  action :symlink
end


