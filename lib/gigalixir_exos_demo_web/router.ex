defmodule GigalixirExosDemoWeb.Router do
  use GigalixirExosDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GigalixirExosDemoWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/add/:i", PageController, :add
  end

  # Other scopes may use custom stacks.
  # scope "/api", GigalixirExosDemoWeb do
  #   pipe_through :api
  # end
end
