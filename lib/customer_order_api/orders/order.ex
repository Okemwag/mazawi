defmodule CustomerOrderApi.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :item, :string
    field :quantity, :integer
    field :customer_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:item, :quantity])
    |> validate_required([:item, :quantity])
  end
end
