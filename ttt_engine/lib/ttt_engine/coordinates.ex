defmodule TttEngine.Coordinates do
  alias __MODULE__
  @enforce_keys [:row, :col]
  defstruct [:row, :col]

  def new(row, col) when row in 0..2 and col in 0..2 do
    {:ok, %Coordinates{row: row, col: col}}
  end

  def new(_row, _col), do: {:error, :invalid_coordinates}
end
