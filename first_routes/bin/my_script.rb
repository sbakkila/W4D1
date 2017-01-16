require 'addressable/uri'
require 'rest-client'

def index_users
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html'
).to_s

puts RestClient.get(url)
end

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

def show_user(id)
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: "/users/#{id}.json"
).to_s
  puts RestClient.get(url)
end

# create_user("Omzig", "Omzig@gizmo.gizmo")
show_user(3)
