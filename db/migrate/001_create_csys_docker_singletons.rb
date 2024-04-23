class CreateCsysDockerSingletons < ActiveRecord::Migration[5.2]
  def change
#    create_table :csys_docker_singletons do |t|
#      t.string :name
#    end
    s = Setting.find_by_name("app_title")
    if (s == nil) then
      s = Setting.new
      s.name="app_title"
    end
    s.value = "cosmoSys"
    s.save
    s = Setting.find_by_name("rest_api_enabled")
    if (s == nil) then
      s = Setting.new
      s.name="rest_api_enabled"
    end
    s.value = 1
    s.save
    s = Setting.find_by_name("jsonp_enabled")
    if (s == nil) then
      s = Setting.new
      s.name="jsonp_enabled"
    end
    s.value = 1
    s.save
    s = Setting.find_by_name("welcome_text")
    if (s == nil) then
      s = Setting.new
      s.name="welcome_text"
    end
    s.value = "cosmoSys project management tool by cosmoBots.eu"
    s.save
    s = Setting.find_by_name("text_formatting")
    if (s == nil) then
      s = Setting.new
      s.name="text_formatting"
    end
    s.value = "markdown"
    s.save
    s = Setting.find_by_name("ui_theme")
    if (s == nil) then
      s = Setting.new
      s.name="ui_theme"
    end
    s.value = "a1"
    s.save
    s = Setting.find_by_name("default_language")
    if (s == nil) then
      s = Setting.new
      s.name="default_language"
    end
    s.value = "en"
    s.save
    s = Setting.find_by_name("force_default_language_for_anonymous")
    if (s == nil) then
      s = Setting.new
      s.name="force_default_language_for_anonymous"
    end
    s.value = 1
    s.save
    s = Setting.find_by_name("force_default_language_for_loggedin")
    if (s == nil) then
      s = Setting.new
      s.name="force_default_language_for_loggedin"
    end
    s.value = 1  
    s.save
    s = Setting.find_by_name("enabled_scm")
    if (s == nil) then
      s = Setting.new
      s.name="enabled_scm"
    end
    s.value = ["Git"]
    s.save

    ### Additionals plugin config ###
    s = Setting.find_by_name("plugin_additionals")
    if s == nil then
      # In order to be able to populate the plugin additionals settings, let's do this hack.
      default_settings = Additionals.loader.default_settings
      s = Setting.new
      s.name = "plugin_additionals"
      s.value = default_settings
      s.save
    end
    sv = s.value
    sv[:global_footer] = "(c) 2019 cosmoBots.eu"
    sv[:global_sidebar] = "![cosmoBots](http://cosmobots.eu/attachments/download/99/Safe-Zone-CosmoBots-Monochrome%20-transparent-Small.png)"
    sv[:external_urls] = "1"
    sv[:add_go_to_top] = "1"
    sv[:new_ticket_message] = "Good luck!"
    sv[:issue_change_status_in_sidebar] = "1"
    sv[:project_overview_content] = "In this overview page you can see the complete hierarchy and dependence diagrams of the project."
    s.value = sv
    s.save


    # Nota, aunque parezca replicado no lo podemos quitar de momento 
    # si acaso hay que trasladarla al cosmosys_git

    s = Setting.find_by_name("plugin_cosmosys_git")
    if (s == nil) then
      s = Setting.new
      s.name = "plugin_cosmosys_git"
    end
    s.value = {
      "repo_local_path" => "/home/redmine/gitbase/csys/%project_id%", 
      "repo_server_path"=> repo_server_path(),
      "repo_template_id" => "template",
      "repo_redmine_path" => "/home/redmine/gitbase/csys_rm/%project_id%.git",
      "import_path" => "01_importing/csys%project_code%.ods",
      "export_path" => "02_exporting/csys%project_code%.ods",
      "export_template_path" => "02_exporting/csExportTemplate.ods",
      "reporting_template_path" => "03_reporting/01_templates",
      "reporting_path" => "03_reporting/02_doc",
      "reporting_img_path" => "03_reporting/03_img"   
    }
    s.save

  end

  def repo_server_path()
    cosmosys_git_variables = {
      user: ENV["COSMOSYS_GIT_USER"],
      instance: ENV["GITLAB_INSTANCE_URL"]
    }

    case cosmosys_git_variables
    in { user: String => user, instance: nil }
      "ssh://git@gitlab/#{user}/%project_id%.git"
    in { user: nil, instance: String => instance }
      "ssh://git@#{instance}/cosmobots/%project_id%.git"
    in { user: String => user, instance: String => instance}
      "ssh://git@#{instance}/#{user}/%project_id%.git"
    in { user: nil, instance: nil }
      "ssh://git@gitlab/cosmobots/%project_id%.git"
    else
      "ssh://git@gitlab/cosmobots/%project_id%.git"
    end
  end
end
