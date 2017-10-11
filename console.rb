require_relative 'models/student'
require 'pry-byebug'

Student.delete_all()

student1 = Student.new({'first_name'=>'Harry', 'last_name'=>'Potter', 'house'=>'Gryffindor', 'age'=>11})
student1.save()

binding.pry
nil
