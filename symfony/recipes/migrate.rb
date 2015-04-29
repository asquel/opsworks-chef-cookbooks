#
# Doctrine database migration.
#
node[:deploy].each do |application, deploy|
  script "run_migration" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php app/console doctrine:migrations:migrate --env="#{node[:symfony][:environment]}
    EOH
  end
end 
