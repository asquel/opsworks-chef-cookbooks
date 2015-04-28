#
# Doctrine database creation.
#
node[:deploy].each do |application, deploy|
  script "create_db" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php app/console doctrine:database:create --if-not-exists
    EOH
  end
end 
