#
# Taken from:
# http://docs.aws.amazon.com/opsworks/latest/userguide/gettingstarted.walkthrough.photoapp.3.html
#
node[:deploy].each do |application, deploy|
  script "install_composer" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    curl -s https://getcomposer.org/installer | php
    php composer.phar config -g github-oauth.github.com 2948bd90717ea896b54e131290b01eb752e0002e
    php composer.phar install --no-dev --no-interaction --optimize-autoloader
    EOH
    only_if { ::File.exists?("#{deploy[:deploy_to]}/current/composer.json") }
  end
end 
