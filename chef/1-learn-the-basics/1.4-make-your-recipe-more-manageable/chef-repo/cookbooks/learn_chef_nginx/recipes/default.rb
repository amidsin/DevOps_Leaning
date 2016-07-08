1#
# Cookbook Name:: learn_chef_nginx
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_update 'Update apt cache daily' do
	frequency 86_400
	action :periodic
end

service 'apache2' do
	supports :status => true
	action [:stop]
end

package 'nginx'

service 'nginx' do
	supports :status => true
	action [:enable, :start]
end

template '/usr/share/nginx/html/index.html' do
	source 'index.html.erb'
end

service 'nginx' do
	supports :status => true
	action [:enable, :restart]
end
