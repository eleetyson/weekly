require_relative './config/environment'

require 'sinatra/activerecord/rake'

require 'dotenv/tasks'
require 'dotenv/load'

task :console do
  def reload!
    load_all 'app'
  end

  Pry.start
end
