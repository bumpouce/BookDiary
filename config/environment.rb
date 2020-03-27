require 'bundler/setup'
Bundler.require

require 'rest-client'
require 'json'
require 'pry'
require 'active_record'
require 'rake'
require 'date'
require 'faker'
require 'smarter_csv'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil


require_all 'app'
require_all 'app/models'
require_all 'config'
require_all 'lib'
