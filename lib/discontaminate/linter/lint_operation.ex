defmodule LintOperation do    
    use Agent

    def start(status_msg, lints) do
        lints = Map.new(Enum.map(lints, fn x -> {x, :working}))

        op_state = {status_msg, lints}

        {:ok, pid} = Agent.start_link(fn -> listen(op_state) end)
        
    end

    def listen({status_msg, lints} = op_state) do
        update_state = receive do
            {:lint_progress, lint, state} -> 
                lints[lint] = state
                if Enum.any(Map.values(lints), fn x -> x == :working) do
                    :working
                else
                    :completed
                end
            :cancel -> :cancel
        end

        # TODO: Send {update_state, op_state} to updator

        if update_state == :working, do: listen(op_state)
    end
end