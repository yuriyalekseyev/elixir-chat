defmodule ChatApplication do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(ChatServer.Server, []),
      worker(ChatClient.Server, [])
    ]

    opts = [
      name: ChatApplication.Supervisor,
      strategy: :one_for_one,
      restart: :permanent
    ]

    Supervisor.start_link(children, opts)
  end
end
