class DiagramController < ApplicationController
  def show
    project_key = params[:project_id]
    @project = Project.find(project_key)
    @issues = Issue.where( { :project_id => @project.id } ).visible(User.current).open()
    @relations = []
    @issues.each do |issue|
      issue.relations.each do |relation|
        if not relation.issue_from.closed?() and relation.issue_from.visible?(User.current) \
            and not relation.issue_to.closed?() and relation.issue_to.visible?(User.current)
          @relations.push(relation)
        end
      end
    end
  end
end
