CREATE VIEW order_view AS SELECT orders.OrderID, clients.ClientID, clients.FullName, products.ProductName, orders.Quantity, delivery.DeliveryStatus, delivery.DeliveryDate, address.Street
FROM orders
INNER JOIN clients USING (ClientID)
INNER JOIN products USING (ProductID)
INNER JOIN delivery USING (OrderID)
INNER JOIN address USING (AddressID);