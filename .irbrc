if ENV.include?('RAILS_ENV')
  require 'logger'
  Rails.logger = Logger.new(STDOUT)
end
