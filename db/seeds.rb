User.create!(
  provider: "github",
  uid: "444444",
  username: "Dan",
  email: "dan.reynolds@example.com",
  name: "Daniel Coulter Reynolds",
  avatar_url: "https://avatars.githubusercontent.com/u/123456789?v=4",
  last_login_at: Time.current
)

User.create!(
  provider: "github",
  uid: "555555",
  username: "Wayne",
  email: nil,
  name: "Wayne Sermon",
  avatar_url: "https://avatars.githubusercontent.com/u/987654321?v=4",
  last_login_at: nil
)

User.create!(
  provider: "github",
  uid: "666666",
  username: "Ben",
  email: "ben.mckee@example.com",
  name: "Benjamin Arthur McKee",
  avatar_url: nil,
  last_login_at: Time.current
)
