-- =========================================
-- ANALISIS: Evolución del mercado
-- =========================================

SELECT 
    Año,
    COUNT(*) AS cantidad_juegos,
    SUM("Ventas Global") AS total_ventas,
    ROUND(AVG("Ventas Global"), 2) AS promedio_ventas
FROM videojuegos_limpio
WHERE Año IS NOT NULL
GROUP BY Año
ORDER BY Año;