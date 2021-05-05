
--Créez une vue qui affiche le catalogue produits. L'id, la référence et le nom des produits, ainsi que l'id et le nom de la catégorie doivent apparaître.



CREATE VIEW v_catalogue_produits
AS
SELECT pro_id,pro_ref,pro_name,cat_id,cat_name
FROM products,categories
WHERE products.pro_id=categories.cat_id