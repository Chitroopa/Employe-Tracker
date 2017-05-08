class Project < ActiveRecord::Base
  scope(:current_project, -> do
    where({:current_project => true})
  end)
  has_many(:employees)
end
