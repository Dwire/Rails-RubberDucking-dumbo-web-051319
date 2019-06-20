10.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

5.times do
  Duck.create(name: Faker::Dog.meme_phrase, description: Faker::Dog.breed, student_id: Student.all.sample.id)
end
