# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

25.times do
  city = City.create(name: Faker::Address.city)
end

50.times do
  dog = Dog.new(dog_name: Faker::Name.first_name) #On fait un new au lieu d'un create parce que sinon 
  #il ne va pas pouvoir les créer à cause d'un nombre insuffisant de paramètres(genre on n'a pas les villes)
  dog.city = City.all.sample #Il en sort une au pif
  dog.save #on sauvegarde parce que c'est un new
end

20.times do
  ds = Dogsitter.new(ds_name: Faker::Name.first_name)
  ds.city = City.all.sample 
  ds.save
end

80.times do 
  stroll = Stroll.new
  stroll.dog = Dog.all.sample
  stroll.dogsitter = Dogsitter.all.sample
  stroll.save
end

