User.find_or_create_by!(
  provider: "github",
  uid: "444444"
) do |user|
  user.username = "Dan"
  user.email = "dan.reynolds@example.com"
  user.name = "Daniel Coulter Reynolds"
  user.avatar_url = "https://avatars.githubusercontent.com/u/123456789?v=4"
  user.last_login_at = Time.current
end
User.find_or_create_by!(
  provider: "github",
  uid: "555555"
) do |user|
  user.username = "Wayne"
  user.email = nil
  user.name = "Wayne Sermon"
  user.avatar_url = "https://avatars.githubusercontent.com/u/987654321?v=4"
  user.last_login_at = nil
end
User.find_or_create_by!(
  provider: "github",
  uid: "666666"
) do |user|
  user.username = "Ben"
  user.email = "ben.mckee@example.com"
  user.name = "Benjamin Arthur McKee"
  user.avatar_url = nil
  user.last_login_at = Time.current
end
