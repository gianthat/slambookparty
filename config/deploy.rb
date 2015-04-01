set :application, 'gianthatworks'
set :repo_url, 'git@github.com:efeqdev/slambookparty.git'
server '104.236.32.212', user: 'gianthatworks', roles: %w{web app}

set :log_level, :info

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :rbenv_type, :user 
set :rbenv_ruby, '2.2.0'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :service, :nginx, :reload
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  
  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

# The above restart task is not run by default
# Uncomment the following line to run it on deploys if needed
# after 'deploy:publishing', 'deploy:restart'
