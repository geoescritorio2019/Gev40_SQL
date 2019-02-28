/*

-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- GRUPO y USUARIOS ADMINISTRADORES DE LOS ESQUEMAS DEL GEV v 4.0 Beta
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

*/

-- ----------------------------------------------------------------------------------------------------
-- CONTENIDO ------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- GRUPO  ADMINISTRADOR "GEV_40" DE LA BASE DE DATOS DEL AMBIENTE DE DESARROLLO

-- USUARIO ADMINISTRADOR "ADM" DEL ESQUEMA DE ADMINISTRACION
-- USUARIO ADMINISTRADOR "UNI" DEL ESQUEMA DE VENTANILLA UNICA
-- USUARIO ADMINISTRADOR "FTG" DEL ESQUEMA DE FLUJO DE TRABAJO GEOGRAFICO
-- USUARIO ADMINISTRADOR "IDE" DEL ESQUEMA DE INFRAESTRUCTURA DE DATOS ESPACIALES
-- USUARIO ADMINISTRADOR "KTT" DEL ESQUEMA DE CATASTRO
-- USUARIO ADMINISTRADOR "TSR" DEL ESQUEMA DE TESORERIA
-- USUARIO ADMINISTRADOR "SBI" DEL ESQUEMA DE INTELIGENCIA ESPACIAL DE NEGOCIOS 
-- USUARIO ADMINISTRADOR "URB" DEL ESQUEMA DE DESARROLLO URBANO 

-- Y TODOS LOS ESQUEMAS FUTUROS
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
-- CREACION DE USUARIOS ADMINISTRADORES EN EL AMBIENTE DE DESARROLLO
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- Rol: "GEV_40" -- GRUPO DE USUARIOS SIN LOGIN

DROP USER  if exists  "GEV_40";

CREATE USER "GEV_40" WITH  NOLOGIN NOSUPERUSER  INHERIT  CREATEDB  CREATEROLE  REPLICATION;

COMMENT ON ROLE "GEV_40" IS 'Administrador General de la Base de Datos.';

-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------------
-- User: "ADM"
-- ----------------------------------------------------------------------------------------------------

DROP 	USER if exists "ADM";

CREATE 	USER "ADM" WITH  LOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;

GRANT "GEV_40" TO "ADM" WITH ADMIN OPTION;

COMMENT ON ROLE "ADM" IS 'Administrador del la BD ADM (Administración)';


-- ----------------------------------------------------------------------------------------------------
-- User: "UNI"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "UNI";

CREATE USER "UNI" WITH  LOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;

GRANT "GEV_40" TO "UNI" WITH ADMIN OPTION;

COMMENT ON ROLE "UNI" IS 'Administrador del esquema de Ventanilla Unica de Tramites y Servicios: UNI';


-- ----------------------------------------------------------------------------------------------------
-- User: "IDE"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "IDE";

CREATE USER "IDE" WITH  LOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;

GRANT "GEV_40" TO "IDE" WITH ADMIN OPTION;

COMMENT ON ROLE "IDE" IS 'Administrador del esquema de Infraestructura de Datos Espaciales: IDE.';


-- ----------------------------------------------------------------------------------------------------
-- User: "KTT"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "KTT";

CREATE USER "KTT" WITH   LOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;

GRANT "GEV_40" TO "KTT" WITH ADMIN OPTION;

COMMENT ON ROLE "KTT" IS 'Administrador del Esquema de Catastro: KTT.';


-- ----------------------------------------------------------------------------------------------------
-- User: "TSR"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "TSR";

CREATE USER "TSR" WITH   LOGIN   NOSUPERUSER   INHERIT   NOCREATEDB   NOCREATEROLE   NOREPLICATION;

GRANT "GEV_40" TO "TSR" WITH ADMIN OPTION;

COMMENT ON ROLE "TSR" IS 'Administrador del Esquema de Tesorería: TSR.';


-- ----------------------------------------------------------------------------------------------------
-- User: "SBI"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "SBI";

CREATE USER "SBI" WITH   LOGIN   NOSUPERUSER   INHERIT   NOCREATEDB   NOCREATEROLE   NOREPLICATION;

GRANT "GEV_40" TO "SBI" WITH ADMIN OPTION;

COMMENT ON ROLE "SBI" IS 'Administrador del Esquema de Inteligencia Espacial de Negocios: SBI';


-- ----------------------------------------------------------------------------------------------------
-- User: "URB"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "URB";

CREATE USER "URB" WITH   LOGIN   NOSUPERUSER   INHERIT   NOCREATEDB   NOCREATEROLE   NOREPLICATION;

GRANT "GEV_40" TO "URB" WITH ADMIN OPTION;

COMMENT ON ROLE "URB" IS 'Administrador del Esquema de Desarrollo Urbano: URB';

-- ----------------------------------------------------------------------------------------------------
-- User: "RPP"
-- ----------------------------------------------------------------------------------------------------

DROP USER if exists "RPP";

CREATE USER "RPP" WITH  LOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;

GRANT "GEV_40" TO "RPP" WITH ADMIN OPTION;

COMMENT ON ROLE "RPP" IS 'Administrador del esquema de Registro Publico de la Propiedad Seccion Propiedad RPP';

-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

