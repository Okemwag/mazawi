defmodule CustomerOrderApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerOrderApi.Accounts` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> CustomerOrderApi.Accounts.create_customer()

    customer
  end
end
