require "pathname"
require 'rubygems/indexer'

require "lib/config"

get "/" do
  "Hello World"
end

post "/" do
  if params[:gem] && params[:gem][:tempfile]
    FileUtils.mv params[:gem][:tempfile].path, gem_folder.join(params[:gem][:filename])
    Gem::Indexer.new(gem_repository).generate_index
  end
end

# Returns the path to the gem repository.
def gem_repository
  @gem_repository ||= File.join AppRoot, Server::Config[:gem_repository]
end

# Returns the path to the gem folder.
def gem_folder
  @gem_folder ||= Pathname.new File.join(AppRoot, Server::Config[:gem_folder])
end