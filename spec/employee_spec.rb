require('spec_helper')

describe(Employee) do
  describe("#division") do
    it("tells which employees are in which division") do
      test_division = Division.create({:name => "sales"})
      test_employee = test_division.employees.new({:name => 'Lorne'})
      test_division.save()
      test_employee.division()
      expect(test_employee.division()).to(eq(test_division))
    end
  end
end
