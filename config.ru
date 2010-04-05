require "sinatra"
require "lib/app"

AppRoot = File.dirname(__FILE__)

set :environment, ENV["RACK_ENV"].to_sym
set :root,        AppRoot
set :app_file,    File.join(AppRoot, "lib", "app.rb")

log = File.new "logs/sinatra.log", "a"
STDOUT.reopen log
STDERR.reopen log

disable :run
run Sinatra::Application