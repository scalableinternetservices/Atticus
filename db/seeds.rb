# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Contract.delete_all
Contract.create(title: 'Rails Master',
  company: 'Google',
  description:
    %{
        We need a rockstar hero programmer
      },
  image_url: 'google.jpg',
  pay: 300)

Contract.create(title: 'Django',
  company: 'Apple',
  description:
    %{
        MVC stuff
      },
  image_url: 'apple.jpg',
  pay: 200)

Contract.create(title: 'Hello World',
  company: 'Microsoft',
  description:
    %{
        We need a Windows person
      },
  image_url: 'windows.jpg',
  pay: 100)
User.delete_all
User.create(name: 'Google',
  email: 'google@gmail.com',
  password: 'googleAtticus',
  is_student: false
)
