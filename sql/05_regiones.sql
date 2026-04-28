-- =========================================
-- ANALISIS: Preferencias por región
-- =========================================

WITH ventas_genero AS (
    SELECT 
        Genero,
        SUM("Ventas NA") AS ventas_na,
        SUM("Ventas EU") AS ventas_eu,
        SUM("Ventas JP") AS ventas_jp
    FROM videojuegos_limpio
    GROUP BY Genero
),

ranking_na AS (
    SELECT *, RANK() OVER (ORDER BY ventas_na DESC) AS r_na FROM ventas_genero
),

ranking_eu AS (
    SELECT *, RANK() OVER (ORDER BY ventas_eu DESC) AS r_eu FROM ventas_genero
),

ranking_jp AS (
    SELECT *, RANK() OVER (ORDER BY ventas_jp DESC) AS r_jp FROM ventas_genero
)

SELECT 'NA' AS region, Genero, ventas_na AS ventas
FROM ranking_na
WHERE r_na <= 3

UNION ALL

SELECT 'EU', Genero, ventas_eu
FROM ranking_eu
WHERE r_eu <= 3

UNION ALL

SELECT 'JP', Genero, ventas_jp
FROM ranking_jp
WHERE r_jp <= 3

ORDER BY region, ventas DESC;