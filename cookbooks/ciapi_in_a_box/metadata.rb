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
  
attribute "ciapi_in_a_box/install_dir",
  :display_name => "Base folder to install all components in",
  :description => "Base folder to install all components in (eg: C:\Websites)",
  :default => "C:\\Websites",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices", "ciapi_in_a_box::CIAPI.docs"],
  :required => "optional"
  
attribute "ciapi_in_a_box/RESTWebServices/svn_url",
  :display_name => "SVN url of location where installers are kept",
  :description => "Versioned binaries are expected to be at this location",
  :default => "https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/RestWebServices",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices"],
  :required => "optional"
  
attribute "ciapi_in_a_box/RESTWebServices/version",
  :display_name => "RESTWebServices version to install",
  :description => "The version of RESTWebServices to install",
  :default => "RESTWebservices.0.834",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::update_RESTWebServices"],
  :required => "optional"
  
 attribute "ciapi_in_a_box/CIAPI.docs/version",
  :display_name => "CIAPI.docs version to install",
  :description => "The version of CIAPI.docs to install",
  :default => "CIAPI.docs.0.588",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::CIAPI.docs"],
  :required => "optional"

 attribute "ciapi_in_a_box/CIAPI.docs/svn_url",
  :display_name => "SVN url of location where installers are kept",
  :description => "Versioned binaries are expected to be at this location",
  :default => "https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/CIAPI.docs",
  :recipes => ["ciapi_in_a_box::default", "ciapi_in_a_box::CIAPI.docs"],
  :required => "optional"

