namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    15.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    30.times do
      karat = Faker::Number.number(5)
      weight = Faker::Number.number(4)
      price = Faker::Number.number(10)
      value = Faker::Number.number(8)

      users.each { |user| user.value_inquiry.create!(karat: karat, weight: weight, price: price, value: value) }
    end
  end
end