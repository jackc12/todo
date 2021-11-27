defmodule Todo.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Todos.Todo_repo



  # FROM https://stackoverflow.com/questions/47354778/elixir-map-with-mixed-keys
  defp key_to_atom(map) do
    Enum.reduce(map, %{}, fn
      {key, value}, acc when is_atom(key) -> Map.put(acc, key, value)
      {key, value}, acc when is_binary(key) -> Map.put(acc, String.to_existing_atom(key), value)
    end)
  end

  

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo_repo{}, ...]

  """
  def list_todos do
    Repo.all(Todo_repo)
  end

  @doc """
  Gets a single todo_repo.

  Raises `Ecto.NoResultsError` if the Todo repo does not exist.

  ## Examples

      iex> get_todo_repo!(123)
      %Todo_repo{}

      iex> get_todo_repo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo_repo!(id), do: Repo.get!(Todo_repo, id)

  @doc """
  Creates a todo_repo.

  ## Examples

      iex> create_todo_repo(%{field: value})
      {:ok, %Todo_repo{}}

      iex> create_todo_repo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo_repo(attrs \\ %{}) do
    %Todo_repo{}
    |> Todo_repo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo_repo.

  ## Examples

      iex> update_todo_repo(todo_repo, %{field: new_value})
      {:ok, %Todo_repo{}}

      iex> update_todo_repo(todo_repo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo_repo(%Todo_repo{} = todo_repo, attrs) do
    attrs = key_to_atom(attrs)
    attrs = Map.put(attrs, :is_completed, todo_repo.is_completed or attrs.is_completed)
    todo_repo
    |> Todo_repo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo_repo.

  ## Examples

      iex> delete_todo_repo(todo_repo)
      {:ok, %Todo_repo{}}

      iex> delete_todo_repo(todo_repo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo_repo(%Todo_repo{} = todo_repo) do
    Repo.delete(todo_repo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo_repo changes.

  ## Examples

      iex> change_todo_repo(todo_repo)
      %Ecto.Changeset{data: %Todo_repo{}}

  """
  def change_todo_repo(%Todo_repo{} = todo_repo, attrs \\ %{}) do
    Todo_repo.changeset(todo_repo, attrs)
  end
end
