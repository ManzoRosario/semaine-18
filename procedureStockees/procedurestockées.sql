
--1)Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs pour lesquels une commande a été passée.

DELIMITER |
    
CREATE PROCEDURE Lst_Suppliers()
BEGIN
    SELECT sup_name
    FROM suppliers
    JOIN products ON pro_sup_id = sup_id
    JOIN orders_details ON ode_pro_id = pro_id
    WHERE ode_quantity IS NOT NULL
    GROUP BY sup_name ;  
END |
DELIMITER ;
 --         
SHOW CREATE PROCEDURE Lst_Suppliers;

   CALL `Lst_Suppliers`();


--2)Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente".
DELIMITER |
    
CREATE PROCEDURE Lst_Rush_Orders()
BEGIN
    SELECT * FROM  orders
    WHERE  ord_status LIKE "Commande Urgente" ;
END |
DELIMITER ;      
  

--3)Créer la procédure stockée CA_Supplier, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée.

DELIMITER |
    
CREATE PROCEDURE CA_Supplier(
    IN p_id INT(10),
    IN p_year INT(4))
BEGIN
    SELECT sup_name,
       ROUND(SUM( ode_quantity *( ode_unit_price *(1 - ode_discount * 0.01))),2)AS CA
    FROM orders
    JOIN orders_details ON ord_id = ode_ord_id
    JOIN products ON pro_id = ode_pro_id
    JOIN suppliers ON pro_sup_id = sup_id
    WHERE ord_payment_date LIKE CONCAT(p_year, "%") AND sup_id = p_id
    GROUP BY sup_name ;
END |
DELIMITER ;
        
               
                   
            
             
    

    