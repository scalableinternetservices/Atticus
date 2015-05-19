# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Contract.delete_all

#for i in (0..100)
Contract.create(title: 'Rails Master',
  company: 'Google',
  description:
    %{
        We need a rockstar hero programmer
      },
  image_url: 'google.jpg',
  pay: rand(200...1000),
  progress: 0,
  done: 0,
  owner: 0,
  worker: 0)
Contract.create(title: 'Django',
  company: 'Apple',
  description:
    %{
        MVC stuff
      },
  image_url: 'apple.jpg',
  pay: rand(200...1000),
  progress: 0,
  done: 0,
  owner: 0,
  worker: 0
)
Contract.create(title: 'Hello World',
  company: 'Microsoft',
  description:
    %{
        We need a Windows person
      },
  image_url: 'windows.jpg',
  pay: rand(200...1000),
  progress: 0,
  done: 0,
  owner: 0,
  worker: 0)
#end

User.delete_all


for i in 0..10
  User.create(
              first_name: 'test' + i.to_s,
              last_name: 'last' + i.to_s,
              school: 'UCLA',
              email: 'test' + i.to_s + '@yahoo.com',
              password: '12345678',
              is_student: true 
)

end
  User.create(
              first_name: 'larry',
              last_name: 'page',
              corporation: 'Google',
              email: 'larry@google.com',
              password: '12345678',
              is_student: false
)
  User.create(
              first_name: 'steve',
              last_name: 'jobs',
              corporation: 'Apple',
              email: 'steve@apple.com',
              password: '12345678',
              is_student: false
)
  User.create(
              first_name: 'billy',
              last_name: 'gates',
              corporation: 'Microsoft',
              email: '3commaclub@microsoft.com',
              password: '12345678',
              is_student: false
)

["C++","Java","JavaScript","Python","Ruby"].each do |t|
  SkillTag.find_or_create_by(name: t)
end

