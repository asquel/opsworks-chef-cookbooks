template "#{node[:phpmyadmin][:cfg][:path]}/config.inc.php" do
  source "phpmyadmin/config.inc.php.erb"
  owner "root"
  group "root"
  mode 0644
end