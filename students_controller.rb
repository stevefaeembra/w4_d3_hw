require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# new
get ('/students/new') do
  erb(:new)
end

# index
get('/students') do
  @students = Student.all
  erb(:index)
end

# show
get('/students/:id') do
  @student = Student.find(params[:id])
  erb(:show)
end

# create
post('/students') do
  Student.new(params).save
  redirect to '/students'
end

# edit
get('/students/:id/edit') do
  @student = Student.find(params[:id])
  erb(:edit)
end

# update
post('/students/:id') do
  Student.new(params).update
  redirect to '/students'
end

# destroy
