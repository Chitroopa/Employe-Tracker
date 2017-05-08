class CreateDivision < ActiveRecord::Migration[5.1]
  def change
    create_table(:divisions) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:division_id, :integer)

      t.timestamps()
    end
  end
end
