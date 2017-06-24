require_relative 'app/api'
require 'raven'

use Raven::Rack

run Api
