/*

-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I ESQUEMAS EN BASE DE DATOS DE DESARROLLO: GEV_DEV v 4.0 Beta
-- ESQUEMAS INICIALES
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

*/

-- DEBE ESTAR CREADA LA BASE DE DATOS GEV_DEV, ANTES DE EJECUTAR EL SCRIPT.

-- ----------------------------------------------------------------------------------------------------
-- CONTENIDO ------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- "ADM" 		ESQUEMA DE ADMINISTRACION

-- "UNI" 		ESQUEMA DE VENTANILLA UNICA
-- "UNI_KAT" 	ESQUEMA DE CATALOGOS DE VENTANILLA UNICA

-- "IDE" 		ESQUEMA DE INFRAESTRUCTURA DE DATOS ESPACIALES
-- "IDE_KAT" 	ESQUEMA DE CATALOGOS DE INFRAESTRUCTURA DE DATOS ESPACIALES

-- "KTT" 		ESQUEMA DE CATASTRO
-- "KTT_KAT" 	ESQUEMA DE CATALOGOS DE CATASTRO
-- "KTT_FTG" 	ESQUEMA DE FLUJO DE TRABAJO GEOGRAFICO CATASTRAL

-- "TSR" 		ESQUEMA DE TESORERIA
-- "TSR_KAT" 	ESQUEMA DE CATALOGOS DE TESORERIA
-- "TSR_FTG" 	ESQUEMA DE FLUJO DE TRABAJO GEOGRAFICO DE TESORERIA

-- "SBI" 		ESQUEMA DE INTELIGENCIA ESPACIAL DE NEGOCIOS 
-- "SBI_KAT" 	ESQUEMA DE CATALOGOS DE INTELIGENCIA ESPACIAL DE NEGOCIOS 

-- "URB" 		ESQUEMA DE DESARROLLO URBANO
-- "URB_KAT" 	ESQUEMA DE CATALOGOS DE DESARROLLO URBANO
-- "URB_FTG" 	ESQUEMA DE FLUJO DE TRABAJO GEOGRAFICO DE DESARROLLO URBANO

-- "RPP" 		ESQUEMA DE REGISTRO PUBLICO DE LA PROPIEDAD SECCION PROPIEDAD
-- "RPP_KAT" 	ESQUEMA DE CATALOGOS DEL REGISTRO PUBLICO DE LA PROPIEDAD SECCION PROPIEDAD
-- "RPP_FTG" 	ESQUEMA DE FLUJO DE TRABAJO GEOGRAFICO DEL REGISTRO PUBLICO DE LA PROPIEDAD SECCION PROPIEDAD


-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
-- CREACION DE ESQUEMAS EN EL AMBIENTE DE DESARROLLO
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: ADM (ADMINISTRACION DEL PORTAL Y USUARIOS)
-- ----------------------------------------------------------------------------------------------------

DROP 	SCHEMA if exists  "ADM" ;

CREATE 	SCHEMA "ADM"     	AUTHORIZATION "ADM";

COMMENT ON SCHEMA "ADM"    	IS 'Esquema de administracion de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "ADM" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "ADM";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: UNI (VENTANILLA UNICA)
-- ----------------------------------------------------------------------------------------------------

DROP 	SCHEMA if exists  "UNI" ;

CREATE 	SCHEMA "UNI"     	AUTHORIZATION "UNI";

COMMENT ON SCHEMA "UNI"     IS 'Esquema de la Ventanilla Unica de Recepcion y Entrega de tramites de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "UNI" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "UNI";
	
-- SCHEMA: UNI_KAT (CATALOGOS)

DROP SCHEMA if exists  "UNI_KAT" ;

CREATE SCHEMA "UNI_KAT"     	AUTHORIZATION "UNI";

COMMENT ON SCHEMA "UNI_KAT"     IS 'Esquema de catalogos de UNI_KAT';

ALTER DEFAULT PRIVILEGES IN SCHEMA "UNI_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "UNI";

-- SCHEMA: UNI_FTG (FLUJO DE TRABAJO GEOGRAFICO )

DROP SCHEMA if exists  "UNI_FTG" ;

CREATE 	SCHEMA "UNI_FTG"     	AUTHORIZATION "KTT";

COMMENT ON SCHEMA "UNI_FTG"     IS 'Esquema del Flujo de Trabajo Geografico de GEV 4.0. Catastral';

ALTER DEFAULT PRIVILEGES IN SCHEMA "UNI_FTG" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "UNI";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: IDE (INFRAESTRUCTURA DE DATOS ESPACIALES)
-- ----------------------------------------------------------------------------------------------------

DROP 	SCHEMA if exists  "IDE" CASCADE;

CREATE 	SCHEMA "IDE"     AUTHORIZATION "IDE";

COMMENT ON SCHEMA "IDE"     IS 'Esquema de Infraestructura de Datos Espaciales de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "IDE" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "IDE";
	
-- SCHEMA: IDE_KAT (CATALOGOS)

DROP SCHEMA if exists  "IDE_KAT" ;

CREATE 	SCHEMA "IDE_KAT"     AUTHORIZATION "IDE";

COMMENT ON SCHEMA "IDE_KAT"     IS 'Esquema de catálogos del IDE';

ALTER DEFAULT PRIVILEGES IN SCHEMA "IDE_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "IDE";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: KTT (CATASTRO)
-- ----------------------------------------------------------------------------------------------------

DROP SCHEMA if exists  "KTT" ;

CREATE 	SCHEMA "KTT"     AUTHORIZATION "KTT";

COMMENT ON SCHEMA "KTT"     IS 'Esquema de Catastro de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "KTT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "KTT";
	
-- SCHEMA: KTT_KAT (CATALOGOS)

DROP SCHEMA if exists  "KTT_KAT" ;

CREATE 	SCHEMA "KTT_KAT"     AUTHORIZATION "KTT";

COMMENT ON SCHEMA "KTT_KAT"     IS 'Esquema de catálogos de Catastro. ';

ALTER DEFAULT PRIVILEGES IN SCHEMA "KTT_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "KTT";

-- SCHEMA: KTT_FTG

DROP SCHEMA if exists  "KTT_FTG" ;

CREATE 	SCHEMA "KTT_FTG"     	AUTHORIZATION "KTT";

COMMENT ON SCHEMA "KTT_FTG"     IS 'Esquema del Flujo de Trabajo Geografico de GEV 4.0. Catastral';

ALTER DEFAULT PRIVILEGES IN SCHEMA "KTT_FTG" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "KTT";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: TSR (TESORERIA)
-- ----------------------------------------------------------------------------------------------------

DROP SCHEMA if exists  "TSR" ;

CREATE 	SCHEMA "TSR"     AUTHORIZATION "TSR";

COMMENT ON SCHEMA "TSR"     IS 'Esquema de Tesorería de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "TSR" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "TSR";
	
-- SCHEMA: TSR_KAT (CATALOGOS)

DROP SCHEMA if exists  "TSR_KAT" ;

CREATE SCHEMA "TSR_KAT"     AUTHORIZATION "TSR";

COMMENT ON SCHEMA "TSR_KAT"     IS 'Esquema de catálogos de Tesorería.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "TSR_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "TSR";

-- SCHEMA: TSR_FTG

DROP SCHEMA if exists  "TSR_FTG" ;

CREATE 	SCHEMA "TSR_FTG"     	AUTHORIZATION "TSR";

COMMENT ON SCHEMA "TSR_FTG"     IS 'Esquema del Flujo de Trabajo Geografico de GEV 4.0. Catastral';

ALTER DEFAULT PRIVILEGES IN SCHEMA "TSR_FTG" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "TSR";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: SBI (INTELIGENCIA DE NEGOCIO ESPACIAL)
-- ----------------------------------------------------------------------------------------------------

DROP 	SCHEMA if exists  "SBI" ;

CREATE 	SCHEMA "SBI"     AUTHORIZATION "SBI";

COMMENT ON SCHEMA "SBI"     IS 'Esquema de Inteligencia Espacial de Negocios de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "SBI" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "SBI";

-- SCHEMA: SBI_KAT (CATALOGOS)

DROP SCHEMA if exists  "SBI_KAT" ;

CREATE SCHEMA "SBI_KAT"     AUTHORIZATION "SBI";

COMMENT ON SCHEMA "SBI_KAT"     IS 'Esquema de catálogos de Inteligencia Espacial de Negocios';

ALTER DEFAULT PRIVILEGES IN SCHEMA "SBI_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "SBI";

-- SCHEMA: SBI_FTG

DROP SCHEMA if exists  "SBI_FTG" ;

CREATE 	SCHEMA "SBI_FTG"     	AUTHORIZATION "TSR";

COMMENT ON SCHEMA "SBI_FTG"     IS 'Esquema del Flujo de Trabajo Geografico de GEV 4.0. Catastral';

ALTER DEFAULT PRIVILEGES IN SCHEMA "SBI_FTG" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "SBI";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: URB (DESARROLLO URBANO)
-- ----------------------------------------------------------------------------------------------------

DROP 	SCHEMA if exists  "URB" ;

CREATE 	SCHEMA "URB"     AUTHORIZATION "URB";

COMMENT ON SCHEMA "URB"     IS 'Esquema de Inteligencia Espacial de Negocios de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "URB" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "URB";

-- SCHEMA: URB_KAT (CATALOGOS)

DROP SCHEMA if exists  "URB_KAT" ;

CREATE SCHEMA "URB_KAT"     AUTHORIZATION "URB";

COMMENT ON SCHEMA "URB_KAT"     IS 'Esquema de catálogos de Inteligencia Espacial de Negocios';

ALTER DEFAULT PRIVILEGES IN SCHEMA "URB_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "URB";

-- SCHEMA: URB_FTG

DROP SCHEMA if exists  "URB_FTG" ;

CREATE 	SCHEMA "URB_FTG"     	AUTHORIZATION "TSR";

COMMENT ON SCHEMA "URB_FTG"     IS 'Esquema del Flujo de Trabajo Geografico de GEV 4.0. Catastral';

ALTER DEFAULT PRIVILEGES IN SCHEMA "URB_FTG" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "URB";


-- ----------------------------------------------------------------------------------------------------
-- SCHEMA: RPP (REGISTRO PUBLICO DE LA PROPIEDAD SECCION PROPIEDAD)
-- ----------------------------------------------------------------------------------------------------

DROP 	SCHEMA if exists  "RPP" ;

CREATE 	SCHEMA "RPP"     AUTHORIZATION "RPP";

COMMENT ON SCHEMA "RPP"     IS 'Esquema de Inteligencia Espacial de Negocios de GEV 4.0.';

ALTER DEFAULT PRIVILEGES IN SCHEMA "RPP" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "RPP";

-- SCHEMA: RPP_KAT (CATALOGOS)

DROP SCHEMA if exists  "RPP_KAT" ;

CREATE SCHEMA "RPP_KAT"     AUTHORIZATION "RPP";

COMMENT ON SCHEMA "RPP_KAT"     IS 'Esquema de catálogos de Inteligencia Espacial de Negocios';

ALTER DEFAULT PRIVILEGES IN SCHEMA "RPP_KAT" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "RPP";

-- SCHEMA: RPP_FTG

DROP SCHEMA if exists  "RPP_FTG" ;

CREATE 	SCHEMA "RPP_FTG"     	AUTHORIZATION "TSR";

COMMENT ON SCHEMA "RPP_FTG"     IS 'Esquema del Flujo de Trabajo Geografico de GEV 4.0. Catastral';

ALTER DEFAULT PRIVILEGES IN SCHEMA "RPP_FTG" GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLES TO "RPP";


-- ----------------------------------------------------------------------------------------------------
-- ESTABLECIENDO LAS TRAYECTORIAS DE BUSQUEDA DE TABLAS
-- ----------------------------------------------------------------------------------------------------

SHOW search_path;

ALTER DATABASE "GEV_DEV"   	SET search_path TO 	
"ADM", 
"UNI", "UNI_KAT", "UNI_FTG",
"IDE", "IDE_KAT", 
"KTT", "KTT_KAT", "KTT_FTG",
"TSR", "TSR_KAT", "TSR_FTG",
"SBI", "SBI_KAT", "SBI_FTG",
"URB", "URB_KAT", "URB_FTG",															
"RPP", "RPP_KAT", "RPP_FTG", "$user", public, topology ;

SHOW search_path;
															
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
