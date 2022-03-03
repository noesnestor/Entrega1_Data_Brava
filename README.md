# Entrega1_Data_Brava

## Instrucciones

1. Ingresar a localhost:8080
2. Crear conexion en Airflow con los siguientes nombres:
 - **testing-heroku**: Con los datos de la base de test en heroku
 - **dw**: Con los datos de la base postgres-dw que levanta docker

|hostname|schema|username|passw|
|---|---|---|---|
|postgres-dw  | postgres  | postgres  |  postgres |   |

3. Ejecutar DAG **execute_bi_load**