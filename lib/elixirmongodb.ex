defmodule Elixirmongodb do
  use Application, MongoPool

  def start(_type, _args) do

    {:ok, _} = MongoPool.start_link(database: "test")

    Mongo.insert_one(MongoPool, "pessoas", %{cod: 1, name: "Kleber"})

    cursor = Mongo.find(MongoPool, "pessoas", %{cod: 42}) |> Enum.take(1)
    Enum.to_list(cursor) |> IO.inspect
  end

end
