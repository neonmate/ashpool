require 'pry'

Dir["config/*.rb"].each {|file| require_relative file }
Dir["lib/*.rb"].each {|file| require_relative file }
Dir["app/*.rb"].each {|file| require_relative file }

run Api
