maintainer       "David Laing (CityIndex Ltd.)"
maintainer_email "david.laing@cityindex.com"
license          IO.read(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE')))
description      "Install & configure CIAPI-in-a-box"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

depends 'utilities'
depends 'sys_monitoring'

recipe 'ciapi_in_a_box::default', 'Downloads and configures all the CIAPI-in-a-box components'
recipe "ciapi_in_a_box::update_RESTWebServices", "Backs up the BlogEngine database to a local machine directory."
recipe "ciapi_in_a_box::update_CIAPI.docs", "Restores the BlogEngine database from a local machine directory."

attribute "ciapi_in_a_box/svn_username",
  :display_name => "SVN username",
  :description => "SVN username (readonly access required)",
  :default => "ciapiinaboxinstaller",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices", "ciapi_in_a_box::CIAPI.docs"],
  :required => "optional"

attribute "ciapi_in_a_box/svn_password",
  :display_name => "SVN password",
  :description => "SVN password (readonly access required)",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices", "ciapi_in_a_box::CIAPI.docs"],
  :required => "required"
  
attribute "ciapi_in_a_box/svn_manifest_url",
  :display_name => "SVN url of location where version manifest is kept",
  :description => "The manifest specifies the collection of component versions that should be installed on this server. eg: https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/as_live.manifest.json or https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/bleeding_edge.manifest.json",
  :default => "https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/as_live.manifest.json",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices"],
  :required => "optional"
    
attribute "ciapi_in_a_box/install_dir",
  :display_name => "Base folder to install all components in",
  :description => "Base folder to install all components in (eg: C:\Websites)",
  :default => "C:\\Websites",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices", "ciapi_in_a_box::CIAPI.docs"],
  :required => "optional"


