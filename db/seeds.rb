# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all
Review.destroy_all
User.delete_all

NUM_USER = 25
PASSWORD = 'shurooq20'

super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

NUM_USER.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end

users = User.all 

70.times do 
    p = Idea.create({
        title: Faker::Hacker.say_something_smart,
        description: Faker::ChuckNorris.fact,
        user: users.sample,
       
    })

    if p.valid? 
        rand(0..25).times.each do
            Review.create(
                body: Faker::Hipster.paragraph,
                idea: p,
                user: users.sample,
            )
        end
    end

end

puts Cowsay.say("Generated #{Idea.count} ideas", :frogs)
puts Cowsay.say("Generated #{Review.count} reviews", :tux)
puts Cowsay.say("Generated #{User.count} users", :sheep)