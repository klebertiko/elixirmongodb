defmodule Elixirmongodb do
  use Application, DbPool

  def start(_type, _args) do
    {:ok, _} = DbPool.start_link(database: "test")

    Mongo.insert_one(DbPool, "foo", %{cod: 42, name: "foo"})
    cursor = Mongo.find(DbPool, "foo", %{cod: 42}) |> Enum.take(1)
    IO.puts(cursor)

    #mongo = Mongo.connect!
    #db = Mongo.db(mongo, "test")
    #userColl = Mongo.Db.collection(db, "user")
    #[   %{nome: "Pessoa 0", email: "pessoa0@email.com"},
    #    %{nome: "Pessoa 1", email: "pessoa1@email.com"},
    #    %{nome: "Pessoa 2", email: "pessoa2@email.com"}, ] |> Mongo.Collection.insert(userColl)
    #{ :ok, mongo: mongo, db: db, anycoll: userColl }
  end

end
