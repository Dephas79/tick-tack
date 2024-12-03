defmodule TttEngine.Rules do
  alias __MODULE__
  defstruct state: :initialized

  def new() do
    {:ok, %Rules{}}
  end

  def check(%Rules{state: :initialized} = rules, :add_player) do
    {:ok, %Rules{rules | state: :player_one_turn}}
  end

  def check(%Rules{state: :player_one_turn} = rules, {:move, :player_one}) do
    {:ok, %Rules{rules | state: :player_two_turn}}
  end

  def check(%Rules{state: :player_two_turn} = rules, {:move, :player_two}) do
    {:ok, %Rules{rules | state: :player_one_turn}}
  end

  def check(%Rules{state: :player_one_turn} = rules, {:win_check, results}) do
    case results do
      :win -> {:ok, %Rules{rules | state: :game_over}}
      :draw -> {:ok, %Rules{rules | state: :game_over}}
      :no_win -> {:ok, rules}
    end
  end

  def check(%Rules{state: :player_two_turn} = rules, {:win_check, results}) do
    case results do
      :win -> {:ok, %Rules{rules | state: :game_over}}
      :draw -> {:ok, %Rules{rules | state: :game_over}}
      :no_win -> {:ok, rules}
    end
  end

  def check(_rule, _action), do: :error
end
