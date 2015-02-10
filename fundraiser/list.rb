require_relative 'project'

class List
  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def funding_request

    @projects.each do |project|
      project.add_funds(25)
      puts project
    end
  end
end