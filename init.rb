Redmine::Plugin.register :csys_docker do
  name 'cSys Docker plugin'
  author 'Txinto Vaz'
  description 'This is a plugin to allow automatic Redmine configuration from a dockerfile'
  version '0.0.1'
  url 'http://github.com/cosmoBots/csys_docker'
  author_url 'http://cosmobots.eu'
  #requires_redmine_plugin :cosmosys_rm , :version_or_higher => '0.0.2'
end
