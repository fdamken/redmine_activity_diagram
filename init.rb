Redmine::Plugin.register :redmine_activity_diagram do
  name 'Redmine Activity Diagram Plugin'
  author 'Fabian Damken'
  description 'This plugin visualizes the issue dependencies using an activity diagram.'
  version '1.0.0-SNAPSHOT'
  url 'https://github.com/fdamken/redmine_activity_diagram'
  author_url 'https://github.com/fdamken'

  permission :diagram, { :diagram => [:show] }, :public => true
  menu :project_menu, :diagram, { :controller => 'diagram', :action => 'show' }, :caption => :tab_diagram_title, :after => :activity, :param => :project_id
end
