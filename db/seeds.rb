require 'faker'
angel = User.create(name: "Angel", email: "angel@gmail.com", password: "123")

man = Superhero.create(name: "Superman", bio: "Leaping from tall buildings. Kinda have a weak spot for brunettes. Absolutely hate green. EVERYTHING GREEN...")

10.times do
  Superhero.create(name: "Super " + Faker::Internet.user_name, specialty: Faker::Company.bs, bio: Faker::Lorem.paragraph)
end

