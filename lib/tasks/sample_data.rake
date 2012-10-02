# use the following commands:
# bundle exec rake db:reset
# bundle exec rake db:populate
# bundle exec rake db:test:prepare
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    # create! is just like the create method, except it raises an exception for an invalid user rather than returning false
    #User.create!(name: "Example User",
    #             email: "example@railstutorial.org",
    #             password: "foobar",
    #             password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end


  end
end
