/*

-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO: GEV_DEV
-- ESQUEMAS INICIALES
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

*/

-- ----------------------------------------------------------------------------------------------------
-- CONTENIDO ------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- CREACION DE LA BASE DE DATOS DEL AMBIENTE DE DESARROLLO: GEV_DEV

-- ----------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------- 
-- CREACION DE LA BASE DE DATOS DEL AMBIENTE DE DESARROLLO: GEV_DEV
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- Database: GEV_DEV Version 1

DROP DATABASE if exists "GEV_DEV" CASCADE;

CREATE DATABASE "GEV_DEV"
    WITH 
    OWNER 				= "GEV_DEV40"
    ENCODING 			= 'UTF8'
    LC_COLLATE 			= 'es_MX.UTF-8' -- 'en_US.UTF-8'
    LC_CTYPE 			= 'es_MX.UTF-8' -- 'en_US.UTF-8'
    TABLESPACE 			= pg_default
    CONNECTION LIMIT 	= -1;

-- SE EJECUTA DESPUES DE LA CREACION DE ESQUEMAS

/*
ALTER DATABASE "GEV_DEV"   	SET search_path TO 	"DEV_ADM", 	"DEV_UNI", "DEV_UNI_KAT", "DEV_FTG", "DEV_FTG_KAT", "DEV_IDE", "DEV_IDE_KAT", 
															"DEV_KTT", "DEV_KTT_KAT", "DEV_TSR", "DEV_TSR_KAT", "DEV_SBI", "DEV_SBI_KAT", 
															"$user", public, topology ;
	
COMMENT ON DATABASE "GEV_DEV"   IS 'Ambiente de Calidad de GEV v 4.0 Beta.';
*/



 