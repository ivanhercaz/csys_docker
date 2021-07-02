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
     s.value = "---\n- Git\n"
     s.save

     ### Additionals plugin config ###
     s = Setting.find_by_name("plugin_additionals")
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

  end
end
