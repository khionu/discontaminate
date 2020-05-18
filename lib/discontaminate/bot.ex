defmodule Discon.Bot do
  use Application
  alias Alchemy.Client

  defmodule Commands do
    use Alchemy.Cogs

    Cogs.def ping do
      Cogs.say "pong!"
    end
  end

  def start(_type, _args) do
    Client.start(System.get_env("DISCONTAMINATE_TOKEN"), {name: CoreProcs.insert_opts("discord")})

    client = CoreProcs.get("discord")
    use Commands
    client
  end
end
