-- =========================================
-- ANALISIS: Rendimiento por plataforma
-- =========================================

SELECT 
    Plataforma,
    COUNT(*) AS cantidad_juegos,
    SUM("Ventas Global") AS total_ventas,
    ROUND(AVG("Ventas Global"), 2) AS promedio_por_juego
FROM videojuegos_limpio
GROUP BY Plataforma
ORDER BY total_ventas DESC;