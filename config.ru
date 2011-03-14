# http://forums.site5.com/showthread.php?t=29824&highlight=bundler
ENV['GEM_PATH'] = '/home/waldenda/ruby/gems:/home/waldenda/gems'

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run DairyApp::Application


