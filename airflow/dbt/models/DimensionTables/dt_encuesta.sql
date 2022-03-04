SELECT e.id, e.esta_completada, e.fecha_limite, e.titulo, te.tipo_encuesta
FROM polls_encuesta AS e
INNER JOIN polls_tipoencuesta AS te
ON e.tipo_encuesta_id = te.id