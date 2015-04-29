#
# Doctrine database migration.
#
node[:deploy].each do |application, deploy|
  script "run_migration" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    export SYMFONY__DATABASE__HOST=#{node[:symfony][:database_host]}
    export SYMFONY__DATABASE__NAME=#{node[:symfony][:database_name]}
    export SYMFONY__DATABASE__USER=#{node[:symfony][:database_user]}
    export SYMFONY__DATABASE__PASSWORD=#{node[:symfony][:database_password]}
    export SYMFONY__FLATTENING__ENVIRONNEMENT=#{node[:symfony][:flattening_environnement]}
    export SYMFONY__REQUEST__HOST=#{node[:symfony][:request_host]}
    php app/console doctrine:migrations:migrate --no-interaction --env="#{node[:symfony][:environment]}
    EOH
  end
end 
