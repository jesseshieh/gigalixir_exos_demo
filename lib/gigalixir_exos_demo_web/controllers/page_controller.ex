defmodule GigalixirExosDemoWeb.PageController do
  use GigalixirExosDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
