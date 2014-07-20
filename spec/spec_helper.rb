require 'rspec'
require 'pry'
require 'barometer/support'

require_relative '../lib/weather_object'

class Data
  class Sun; end
end

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.disable_monkey_patching!

  config.include Barometer::Support::Matchers
end
