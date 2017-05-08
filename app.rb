require('pry')
require('launchy')
require('pg')
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('rake')
require('./lib/division')
require('./lib/employee')
also_reload('./**/*.rb')

ENV['RACK_ENV'] = 'test'

get('/') do
  @divisions = Division.all()
  erb(:index)
end

get('/division/new') do
  erb(:division_form)
end

post('/division/new') do
  name = params.fetch('name')
  new_division = Division.create({:name => name})
  @divisions = Division.all()
  erb(:index)
end

get('/division/:id') do
  id = params.fetch('id')
  @division = Division.find(id)
  erb(:division)
end

delete('/division/:id') do
  id = params.fetch('id')
  @division = Division.find(id)
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end

post('/division/rename/:id') do
  id = params.fetch('id')
  @division = Division.find(id)
  erb(:division_rename)
end

patch('/division/rename/:id') do
  id = params.fetch('id')
  name = params.fetch('name')
  @division = Division.find(id)
  @division.update({:name => name})
  @divisions = Division.all()
  erb(:index)
end
