unless ENV['CI']
  require 'simplecov'
  SimpleCov.start
end
require 'futures_pipeline'
require 'rspec'
require 'webmock/rspec'

def a_delete(path)
  a_request(:delete, 'http://militarydemo.pipelinenc.com/' + path)
end

def a_get(path)
  a_request(:get, 'http://militarydemo.pipelinenc.com/' + path)
end

def a_post(path)
  a_request(:post, 'http://militarydemo.pipelinenc.com/' + path)
end

def a_put(path)
  a_request(:put, 'http://militarydemo.pipelinenc.com/' + path)
end

def stub_delete(path)
  stub_request(:delete, 'http://militarydemo.pipelinenc.com/' + path)
end

def stub_get(path)
  stub_request(:get, 'http://militarydemo.pipelinenc.com/' + path)
end

def stub_post(path)
  stub_request(:post, 'http://militarydemo.pipelinenc.com/' + path)
end

def stub_put(path)
  stub_request(:put, 'http://militarydemo.pipelinenc.com/' + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
