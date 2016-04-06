#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
	action :install
end

# http start
service "httpd" do
	action [ :enable, :start]
end

template "httpd.conf" do
	path "/etc/httpd/httpd.conf"
	owner "root"
	group "root"
	mode 0644

	notifies :reload, 'service[httpd]'
end

#disable iptables
service 'iptables' do
	action [:disable, :stop]
end
