defmodule LintPass do
    @callback id() :: charlist()
    @callback tags() :: [charlist()]
    @callback description() :: charlist()
    @callback deps() :: [module()]
    @callback pass(ctx :: %LintContext, deps :: [any])
     :: :pass | {:fail, integer(), charlist()} | {:error, any()}
end