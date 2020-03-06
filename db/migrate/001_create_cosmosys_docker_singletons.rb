class CreateCosmosysDockerSingletons < ActiveRecord::Migration[5.2]
  def change
#    create_table :cosmosys_docker_singletons do |t|
#      t.string :name
#    end
     s = Setting.find_by_name("app_title")
     s.value = "cosmoSys-Req"
     s.save
     s = Setting.find_by_name("rest_api_enabled")
     s.value = 1
     s.save
     s = Setting.find_by_name("jsonp_enabled")
     s.value = 1
     s.save
     s = Setting.find_by_name("welcome_text")
     s.value = "cosmoSys-Req requirements management tool by cosmoBots.eu"
     s.save
     s = Setting.find_by_name("text_formatting")
     s.value = "markdown"
     s.save
     s = Setting.find_by_name("ui_theme")
     s.value = "a1"
     s.save
     s = Setting.find_by_name("default_language")
     s.value = "en"
     s.save
     s = Setting.find_by_name("force_default_language_for_anonymous")
     s.value = 1
     s.save
     s = Setting.find_by_name("force_default_language_for_loggedin")
     s.value = 1  
     s.save
     s = Setting.find_by_name("enabled_scm")
     s.value = "---\n- Git\n"
     s.save

     if (Enumeration.where(:type => "IssuePriority").size == 0) then
       prio = Enumeration.new
       prio.type = "IssuePriority"
       prio.name = "Low"
       prio.is_default = true
       prio.save
     end

  end
end
