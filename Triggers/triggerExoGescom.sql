/*Créer une table commander_articles constituées de colonnes :

codart : id du produit
qte : quantité à commander
date : date du jour*/


CREATE TABLE commander_articles ()
codart INT (10) PRIMARY KEY; -- id du produit
qte INT (5); -- quantité a commander
datedujour DATE --date du jour

)ENGINE=InnoDB



--Créer un déclencheur after_products_update sur la table products : 
--lorsque le stock physique devient inférieur au stock d'alerte, une nouvelle ligne est insérée dans la table commander_articles.

DELIMITER |
CREATE TRIGGER after_products_update
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
if NEW.pro_stock < NEW.pro_stock_alert THEN
INSERT INTO commander_articles (qte,codart,datedujour)
VALUES ((NEW.pro_stock_alert - NEW.pro_stock), NEW.pro_id,NOW());
END IF;
END | 
DELIMITER ;
