User.create!(
  name: "サンプルユーザー",
  email: "hoge@icloud.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n}@icloud.com"
  password = "password"

  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
  )
end
