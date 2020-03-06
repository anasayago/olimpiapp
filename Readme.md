# Evaluación Técnica Desarrollador Backend
## PeruApps

_Solución a la Evaluación Técnica para optar a Desarrollador Backend_

## Intrucciones 📋

* Todos los casos deberán ser desarrollados utilizando frameworks (PHP,
NodeJS o Java).
* Al momento de enviar sus respuestas, consigne todos los datos de ayuda que
considere necesarios.
* Debe adjuntar el repositorio de código, así como la colección generada en
Postman.


### Descripción 📋

_Las sedes olímpicas se dividen en complejos deportivos. Los complejos deportivos se
subdividen en aquellos en los que se desarrolla un único deporte y en los
polideportivos. Los complejos polideportivos tienen áreas designadas para cada
deporte con un indicador de localización (ejemplo: centro, esquina, NE, etc.). Un
complejo tiene una localización, un jefe de organización individual y un área total
ocupada. Los dos tipos de complejos (deporte único y polideportivo) tendrán diferentes
tipos de información. Para cada tipo de sede, se conservará el número de complejos
junto con su presupuesto aproximado. Cada complejo celebra una serie de eventos
(ejemplo: la pista del estadio puede celebrar muchas carreras distintas.). Para cada
evento está prevista una fecha, duración, número de participantes, número de
comisarios. Una lista de todos los comisarios se conservará junto con la lista de los
eventos en los que esté involucrado cada comisario ya sea cumpliendo la tarea de
juez u observador. Tanto para cada evento como para el mantenimiento se necesitará
cierto equipamiento (ejemplo: arcos, pértigas, barras paralelas, etc)_


### Entregables 🔧

* Modelado de base de datos
* Desarrollo de un Api REST que cuente con:
    * Autentificación de usuarios
    * Servicios CRUD de al menos 2 entidades

## Modelado de base de datos ⚙️

_En el directorio principal del proyecto archivo olimpiapp_db.sql_

## Desarrollo del proyecto🔩

_En el directorio principal del proyecto podra encontrar el codigo fuente_

## Coleccion Postman ⌨️

_En el directorio principal del proyecto, archivo:prueba_practica.postman_collection.json_

## Pregunta libre (Opcional, no requiere desarrollo):
### ¿Si este sistema fuese implementado, que mejoras aplicarías a tu solución actual? ###
* Deben crearse más entidades como persona, sede fisica, tipos.
* La ubicacion de las sedes seria con coordenadas(latitud,longitud).
* Agregaria atributo foto para cada sede_
* En la base de datos haria unos triggers para contabilizar, por ejemplo complejos de una sede o comisarios.
* Agregaria gestion de equipamiento
* Agregaria manejo de estados(activos, inactivos)
* En este caso centre evento-deporte. Pero se puede dar el caso que un evento ocupe varios deportes y en la solucion no tome en cuenta eso.

