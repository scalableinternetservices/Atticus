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
    %{<p>
        We need a rockstar hero programmer
      </p>},
  image_url: 'google.jpg',
  pay: 300)

Contract.create(title: 'Django',
  company: 'Apple',
  description:
    %{<p>
        MVC stuff
      </p>},
  image_url: 'apple.jpg',
  pay: 200)

Contract.create(title: 'Hello World',
  company: 'Microsoft',
  description:
    %{<p>
        We need a Windows person
      </p>},
  image_url: 'windows.jpg',
  pay: 100)
