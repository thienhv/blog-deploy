# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.



user = "dev"
ipaddress = "192.168.10.180"

role :app, ["#{user}@#{ipaddress}"]
role :web, ["#{user}@#{ipaddress}"]
role :db,  ["#{user}@#{ipaddress}"]


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server '192.168.10.180', user: 'dev', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
set :ssh_options, {
  keys: %w(/Users/thien.ho/.ssh/todev)
}
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }


set :nginx_server_name, 'amydomain.com'

# ignore this if you do not need SSL
#set :nginx_use_ssl, true
#set :nginx_ssl_cert_local_path, '/path/to/ssl_cert.crt'
#set :nginx_ssl_cert_key_local_path, '/path/to/ssl_cert.key'

desc "Setup ===================================>"
task :setup do
  on roles(:all) do |host|
    puts 'hello setup'
  end
end