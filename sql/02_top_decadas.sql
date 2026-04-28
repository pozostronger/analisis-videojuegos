-- =========================================
-- ANALISIS: Top juegos por década
-- =========================================

WITH juegos_decada AS (
    SELECT
        Nombre,
        Genero,
        "Ventas Global" AS total_juego,
        (CAST(Año AS INT) / 10) * 10 AS decada
    FROM videojuegos_limpio
    WHERE Año IS NOT NULL
),

ranking AS (
    SELECT *,
        RANK() OVER (
            PARTITION BY decada
            ORDER BY total_juego DESC
        ) AS ranking
    FROM juegos_decada
)

SELECT 
    decada,
    Nombre,
    Genero,
    total_juego
FROM ranking
WHERE ranking <= 3
ORDER BY decada DESC, total_juego DESC;