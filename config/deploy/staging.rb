set :stage, :staging
set :branch, :staging
set :deploy_to, "/home/slambookparty/staging"
set :rails_env, :staging

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    user: fetch(:user)
#  }
