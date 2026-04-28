-- =========================================
-- ANALISIS: Ventas por género
-- =========================================

WITH ventas_genero AS (
    SELECT 
        Genero, 
        SUM("Ventas Global") AS total_genero
    FROM videojuegos_limpio
    GROUP BY Genero
),

ranking_juegos AS (
    SELECT
        Nombre,
        Genero,
        "Ventas Global" AS total_juego,
        RANK() OVER (
            PARTITION BY Genero
            ORDER BY "Ventas Global" DESC
        ) AS ranking
    FROM videojuegos_limpio
),

total_global AS (
    SELECT 
        SUM("Ventas Global") AS total_global
    FROM videojuegos_limpio
)

SELECT 
    vg.Genero,
    vg.total_genero,
    rj.Nombre AS top_juego,
    rj.total_juego,
    ROUND(vg.total_genero * 100.0 / tg.total_global, 2) AS porcentaje_categoria
FROM ventas_genero vg
JOIN ranking_juegos rj 
    ON vg.Genero = rj.Genero
CROSS JOIN total_global tg
WHERE rj.ranking = 1
ORDER BY vg.total_genero DESC;