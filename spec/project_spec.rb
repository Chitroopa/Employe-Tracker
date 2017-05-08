require('spec_helper')

describe(Project) do
  describe("#employees") do
    it("tells where empolyees are in it") do
      test_project = Project.create({:name => "Goods team"})
      test_employee1 = Employee.create({:name => "Dave", :project_id => test_project.id})
      test_employee2 = Employee.create({:name => "Chitroopa", :project_id => test_project.id})
      expect(test_project.employees()).to eq([test_employee1, test_employee2])
    end
  end

  describe(".current_project") do
    it("returns current project") do
      test_project1 = Project.create({:name => "Goods project", :current_project => true})
      test_project2 = Project.create({:name => "styling project", :current_project => true})
      test_project3 = Project.create({:name => "db project", :current_project => false})
       expect(Project.current_project()).to eq([test_project1, test_project2])
    end
  end


end
