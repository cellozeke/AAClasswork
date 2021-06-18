# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

garfield = Cat.create!(birth_date: '2011/03/12' , color: 'Brown' , name: 'Garfield' , sex: 'M', description: 'Likes lasagna')
charis = Cat.create!(birth_date: '2019/01/30' , color: 'Black' , name: 'Charis' , sex: 'M', description: 'Likes goldfish')
ayce = Cat.create!(birth_date: '2005/01/17' , color: 'White' , name: 'Ayce' , sex: 'F', description: 'Likes whole pizzas to herself')
jack = Cat.create!(birth_date: '2014/08/19' , color: 'Orange' , name: 'Jack' , sex: 'M', description: 'Likes beanstalks')
mike = Cat.create!(birth_date: '2010/05/12' , color: 'White' , name: 'Mike' , sex: 'M', description: 'Likes being disappointed')
walker = Cat.create!(birth_date: '2012/02/05' , color: 'Gray' , name: 'Walker' , sex: 'M', description: 'Likes walking')
