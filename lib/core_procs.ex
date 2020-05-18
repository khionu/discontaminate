defmodule CoreProcs do
    def get(name) do
        Registry.lookup(Registry.CoreProcs, name)
    end

    def insert_opts(key) do
        {:via, Registry, {Registry.CoreProcs, key}}
    end
end