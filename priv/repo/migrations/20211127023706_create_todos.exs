defmodule Todo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :description, :string
      add :priority, :string
      add :is_completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
