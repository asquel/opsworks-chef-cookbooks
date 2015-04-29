node[:deploy].each do |application, deploy|

  template "#{deploy[:deploy_to]}/current/app/config/parameters_#{node[:symfony][:environment]}.yml" do
    source "parameters.yml.erb"
    mode 0644
    group "root"

    if platform?("ubuntu")
      owner "deploy"
   elsif platform?("amazon")
      owner "deploy"
    end
   variables(
    :parameters => (node[:symfony][:parameters]  rescue nil),
   )

   only_if do
     File.directory?("#{deploy[:deploy_to]}/current/app/config")
   end
  end
end