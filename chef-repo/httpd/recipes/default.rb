#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# install
package "http" do
	action: install
end

# http start
service "http" do
	action[ :enable, :start]
end

template "httpd.conf" do
	path "/etc/httpd/httpd.conf"
	own "root"
	group "root"
	mode 0644

	notifies :reload, 'service[httpd]'
end

