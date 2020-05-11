# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all

70.times do 
    p = Idea.create({
        title: Faker::Hacker.say_something_smart,
        description: Faker::ChuckNorris.fact
       
    })

end

puts Cowsay.say("Generated #{Idea.count} ideas", :frogs)