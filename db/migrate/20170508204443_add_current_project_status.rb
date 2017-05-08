class AddCurrentProjectStatus < ActiveRecord::Migration[5.1]
  def change
    add_column(:projects, :current_project, :boolean)
  end
end
