class Backer

    attr_reader :name

    def initialize(name)
        @name = name
        @backed_projects = []
        
    end

    def back_project(project)
        self.backed_projects << project
        project.add_backer(self)
    end

    def backed_projects
        backer_projects = ProjectBacker.all.select do |project_backer_instance|
            project_backer_instance.backer == self
        end

        backer_projects.map do |project_backer_instance|
            project_backer_instance.project
        end
    end

end
