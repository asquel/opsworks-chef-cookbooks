#
# Doctrine database migration.
#
node[:deploy].each do |application, deploy|
  script "run_migration" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    export SYMFONY__DATABASE__HOST
    export SYMFONY__DATABASE__NAME
    export SYMFONY__DATABASE__USER
    export SYMFONY__DATABASE__PASSWORD
    php app/console doctrine:migrations:migrate --no-interaction --env="#{node[:symfony][:environment]}
    EOH
  end
end 
