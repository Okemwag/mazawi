defmodule CustomerOrderApi.OrdersTest do
  use CustomerOrderApi.DataCase

  alias CustomerOrderApi.Orders

  describe "orders" do
    alias CustomerOrderApi.Orders.Order

    import CustomerOrderApi.OrdersFixtures

    @invalid_attrs %{item: nil, quantity: nil}

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      valid_attrs = %{item: "some item", quantity: 42}

      assert {:ok, %Order{} = order} = Orders.create_order(valid_attrs)
      assert order.item == "some item"
      assert order.quantity == 42
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      update_attrs = %{item: "some updated item", quantity: 43}

      assert {:ok, %Order{} = order} = Orders.update_order(order, update_attrs)
      assert order.item == "some updated item"
      assert order.quantity == 43
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
