defmodule Todo.Todos.Todo_repo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :is_completed, :boolean, default: false
    field :priority, :string

    timestamps()
  end

  @doc false
  def changeset(todo_repo, attrs) do
    todo_repo
    |> cast(attrs, [:description, :priority, :is_completed])
    |> validate_required([:description, :priority, :is_completed])
    |> validate_inclusion(:priority, ["Low", "Medium", "High"]) 
  end
end
