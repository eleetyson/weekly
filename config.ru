require './config/environment'

use Rack::MethodOverride
# mount controllers as needed
run ApplicationController
