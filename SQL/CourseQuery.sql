--������� ����� � �������������� �������
SELECT SUM(Total_Price)/COUNT(*) AS Avg_price FROM Ticket join Orders
on Ticket.ID_Order = Orders.ID_Order WHERE Orders.Payment_Type = 'Cash'

--�������, ����������� ������ 1000 ������ �� �����
SELECT Name FROM Client WHERE ID_Client IN (SELECT ID_Client FROM Orders join Ticket on
Orders.ID_Order = Ticket.ID_Order WHERE Total_Price > 1000) 

--�������� ������� �������
SELECT Screening.ID_Screening, Film.Name, Screening.Price*count(Orders.ID_Order) as Revenue FROM Screening 
JOIN Film on Film.ID_Film = Screening.ID_Film join Orders on Screening.ID_Screening = Orders.ID_Screening
WHERE Screening.ID_Screening = Orders.ID_Screening  Group by Screening.ID_Screening, Film.Name, Screening.Price

--�������� ���-5 �������� �� �������
SELECT DISTINCT TOP 5 Client.ID_Client, Client.Name, MAX(Total_Price) as MaxPrice 
FROM Orders join Ticket on Ticket.ID_Order = Orders.ID_Order join Client on Client.ID_Client = Orders.ID_Client
GROUP BY Client.ID_Client, Client.Name ORDER BY MaxPrice DESC 

--�������� ������, ���� ������� ������ ������� ���� ������
SELECT DISTINCT Orders.ID_Order FROM Orders join Ticket on Ticket.ID_Order = Orders.ID_Order
WHERE Ticket.Total_Price > (SELECT AVG(Total_Price) FROM Ticket)

--�������� ������������ ��������� ������ ����� ������ ������ 18
SELECT MAX(Ticket.Total_Price) AS Max_price FROM Orders JOIN 
Client ON Orders.ID_Client = Client.ID_Client join Ticket on Orders.ID_Order = Ticket.ID_Order
WHERE Client.Gender = 'M' and Client.Age > 18

--�������� ������� � ������� ������� � ����� �����
SELECT Screening.ID_Screening, Screening.Price*count(Orders.ID_Order) AS Revenue_of_Drama FROM 
Film join Screening on Film.ID_Film = Screening.ID_Film join Orders
on Orders.ID_Screening = Screening.ID_Screening join Genre on Film.ID_Genre = Genre.ID_Genre
WHERE Film.ID_Genre = '1' GROUP BY Screening.ID_Screening, Screening.Price

--�������� ������� ���� ������ ��� �������� ������ 18
SELECT AVG(Ticket.Total_Price) AS Avg_Price FROM Orders join Client on 
Orders.ID_Client = Client.ID_Client join Ticket on Ticket.ID_Order = Orders.ID_Order
WHERE Age < 18  
