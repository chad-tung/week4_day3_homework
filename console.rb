require_relative 'models/student'
require_relative 'models/house'
require 'pry-byebug'

Student.delete_all()
House.delete_all()


house1 = House.new({'name'=>'Gryffindor', 'logo'=>'https://goo.gl/images/55nULS'})
house2 = House.new({'name'=>'Slytherin', 'logo'=>'https://goo.gl/images/PvNQTM'})
house3 = House.new({'name'=>'Ravenclaw', 'logo'=>'https://goo.gl/images/44wJyq'})
house4 = House.new({'name'=>'Hufflepuff', 'logo'=>'https://goo.gl/images/xiUEME'})

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({'first_name'=>'Harry', 'last_name'=>'Potter', 'house_id'=>house1.id, 'age'=>11})
student1.save()

student2 = Student.new({'first_name'=>'Draco', 'last_name'=>'Malfoy', 'house_id'=>house2.id, 'age'=>11})
student2.save()

student3 = Student.new({'first_name'=>'Cho', 'last_name'=>'Chang', 'house_id'=>house3.id, 'age'=>12})
student3.save()



binding.pry
nil
