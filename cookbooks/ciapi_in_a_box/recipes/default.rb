unless @node[:ciapi_in_a_box_default_executed]

  include_recipe 'utilities::change_admin_password'
  include_recipe 'sys_monitoring::default'

  include_recipe 'ciapi_in_a_box::update_RESTWebServices'
  include_recipe 'ciapi_in_a_box::update_CIAPI.docs'
  
  include_recipe 'app_iis::start_default_website'

  @node[:ciapi_in_a_box_default_executed] = true
end
