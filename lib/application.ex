defmodule Discon do
    use Application

    def start(_type, _args) do
        children = [
            {Registry, {keys: :unique, name: Registry.CoreProcs}},
            {Alchemy.Client, System.get_env("DISCONTAMINATE_TOKEN")},
            {DynamicSupervisor, name: LintPass.Supervisor, strategy: :one_for_one}
        ]

        opts = [strategy: :one_for_one, name: Discon.Supervisor]

        Supervisor.init(children, opts)
    end
end
