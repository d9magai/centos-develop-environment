# -*- coding: utf-8 -*-
app_home="/home/" + node['app_user']
workspace_dir="#{app_home}/workspace/opencv"

%W[
  #{app_home}
  #{app_home}/workspace
  #{app_home}/workspace/opencv
  #{app_home}/workspace/opencv/src
].each do |path|
  directory path do
    owner node['app_user']
    group node['app_user']
    mode '0755'
  end
end

%w{
.cproject
.project
lena.jpg
}.each do |file|
  cookbook_file  "#{workspace_dir}/#{file}" do
    owner node['app_user']
    group node['app_user']
    source "#{file}"
    mode  "0664"
  end
end

src_file="opencv.c"
cookbook_file  "#{workspace_dir}/src/#{src_file}" do
  owner node['app_user']
  group node['app_user']
  source "#{src_file}"
  mode  "0664"
end

