defmodule GigalixirExosDemoWeb.PageController do
  use GigalixirExosDemoWeb, :controller

  def index(conn, _params) do
    json(conn, %{count: GigalixirExosDemo.Account.get()})
  end

  def add(conn, %{"i" => i}) do
    with {i, _} <- Integer.parse(i),
         :ok = GigalixirExosDemo.Account.add(i) do
      json(conn, %{count: GigalixirExosDemo.Account.get()})
    end
  end
end
