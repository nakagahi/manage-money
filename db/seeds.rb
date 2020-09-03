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

types = ["家賃", "光熱費", "携帯代", "交際費", "食費", "教育費"]

types.each do |type|

  OutputType.create!(

    name: type

  )


end
