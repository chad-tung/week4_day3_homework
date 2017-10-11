require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative 'models/student'
require_relative 'models/house'

get '/hogwarts' do
    erb( :homepage )
end

get '/hogwarts/view_students' do
    @students = Student.all()
    erb ( :students )
end

get '/hogwarts/new' do
    @houses = House.all()
    erb ( :new )
end

post '/hogwarts/confirmation' do
    @student = Student.new(params)
    @student.save()
    erb( :confirmation )
end
