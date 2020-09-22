User.create!(
  name: "サンプルユーザー",
  email: "sample@icloud.com",
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

types_i =["給料", "賞与", "臨時", "給付金"]

types = ["家賃", "光熱費", "携帯代", "交際費", "食費", "教育費"]


types_i.each do |type|

  InputType.create!(

    name: type

  )


end

types.each do |type|

  OutputType.create!(

    name: type

  )


end
