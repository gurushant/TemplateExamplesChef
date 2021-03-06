#
# Cookbook Name:: create_file
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'chefspec'
require 'spec_helper'

describe 'create_file::default' do 
	let(:chef_run) do
	runner=ChefSpec::SoloRunner.new(platform:'ubuntu',version:'12.04')
	runner.converge(described_recipe)	
	end

context 'when test' do
before do
  cookbook_root = File.expand_path('../../../../../../',  __FILE__)
  Chef::Config[:data_bag_path] = File.join(cookbook_root, 'data_bags')
  Chef::Config[:encrypted_data_bag_secret] = File.join(cookbook_root, 'encrypted_data_bag_secret')

  stub_data_bag('test').and_return({id: 'test'})
  stub_data_bag_item('test', 'test').and_return({"id" => "test", "text" => "Hello Dev..123"})


end

it 'creates a file' do
   expect(chef_run).to create_file('/tmp/hello.txt')
   
end


end



end


