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
  @employees = Employee.all()
  erb(:index)
end

get('/division/new') do
  erb(:division_form)
end

post('/division/new') do
  name = params.fetch('name')
  new_division = Division.create({:name => name})
  @divisions = Division.all()
  @employees = Employee.all()
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
  @employees = Employee.all()
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
  @employees = Employee.all()
  erb(:index)
end

get('/employee/new') do
  @divisions = Division.all()
  erb(:employee_form)
end

post('/employee/new')do
  name = params.fetch('name')
  division_id = params.fetch('division_id')
  new_employee = Employee.create({:name => name, :division_id => division_id})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

get('/employee/:id')do
  id = params.fetch('id')
  @employee = Employee.find(id)
  erb(:employee)
end

delete('/employee/:id') do
  id = params.fetch('id')
  @employee = Employee.find(id)
  @employee.delete()
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/employee/rename/:id') do
  id = params.fetch('id')
  @employee = Employee.find(id)
  erb(:employee_rename_form)
end

patch('/employee/rename/:id') do
  id = params.fetch('id')
  @employee = Employee.find(id)
  name = params.fetch('name')
  @employee.update({:name => name})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end
