require('rspec')
require('pg')
require("sinatra/activerecord")
require('division')
require('employee')

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    Division.all().each() do |division|
      division.destroy()
    end
    Employee.all().each() do |employee|
      employee.destroy()
    end
  end
end
