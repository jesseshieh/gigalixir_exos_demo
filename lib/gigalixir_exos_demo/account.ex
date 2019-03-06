defmodule GigalixirExosDemo.Account do
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def cmd do
    "java -cp 'target/*' clojure.main account.clj"
  end

  def start_link(ini),
    do:
      Exos.Proc.start_link(cmd(), ini, [cd: "#{:code.priv_dir(:gigalixir_exos_demo)}/account"],
        name: __MODULE__
      )

  def add(v), do: GenServer.cast(__MODULE__, {:add, v})
  def rem(v), do: GenServer.cast(__MODULE__, {:rem, v})
  def get, do: GenServer.call(__MODULE__, :get, :infinity)
end
