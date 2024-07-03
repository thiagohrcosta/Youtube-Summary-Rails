User.destroy_all

User.create(
  full_name: "John Doe",
  email: "johndoe@doe.com",
  password: "123456",
  password_confirmation: "123456"
)