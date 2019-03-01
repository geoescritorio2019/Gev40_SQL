/*

-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I TRAYECTORIAS DE BUSQUEDA (PATH) EN BASE DE DATOS DE DESARROLLO: GEV_DEV v 4.0 Beta
-- ESQUEMAS INICIALES
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

*/

-- DEBE ESTAR CREADA LA BASE DE DATOS GEV_DEV Y TODOS LOS ESQUEMAS, ANTES DE EJECUTAR EL SCRIPT.

-- ----------------------------------------------------------------------------------------------------
-- CONTENIDO ------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- "DEV_ADM" 		ESQUEMA DE ADMINISTRACION DEL GEV 4.0 Beta

-- "DEV_UNI" 		ESQUEMA DE VENTANILLA UNICA
-- "DEV_UNI_KAT" 	ESQUEMA DE CATALOGOS DE VENTANILLA UNICA

-- "DEV_FTG" 		ESQUEMA DE FLUJO DE TRABAJO GEOGRAFICO
-- "DEV_FTG_KAT" 	ESQUEMA DE CATALOGOS  DE FLUJO DE TRABAJO GEOGRAFICO

-- "DEV_IDE" 		ESQUEMA DE INFRAESTRUCTURA DE DATOS ESPACIALES
-- "DEV_IDE_KAT" 	ESQUEMA DE CATALOGOS DE INFRAESTRUCTURA DE DATOS ESPACIALES

-- "DEV_KTT" 		ESQUEMA DE CATASTRO
-- "DEV_KTT_KAT" 	ESQUEMA DE CATALOGOS DE CATASTRO

-- "DEV_TSR" 		ESQUEMA DE TESORERIA
-- "DEV_TSR_KAT" 	ESQUEMA DE CATALOGOS DE TESORERIA

-- "DEV_SBI" 		ESQUEMA DE INTELIGENCIA ESPACIAL DE NEGOCIOS 
-- "DEV_SBI_KAT" 	ESQUEMA DE CATALOGOS DE INTELIGENCIA ESPACIAL DE NEGOCIOS 

-- "DEV_URB" 		ESQUEMA DE DESARROLLO URBANO 
-- "DEV_URB_KAT" 	ESQUEMA DE CATALOGOS DE DESARROLLO URBANO 

-- SE PUEDE DEJAR DE USAR

-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
SHOW search_path;

SET search_path TO 	"DEV_ADM", 	"DEV_UNI", "DEV_UNI_KAT", "DEV_FTG", "DEV_FTG_KAT", "DEV_IDE", "DEV_IDE_KAT", 
								"DEV_KTT", "DEV_KTT_KAT", "DEV_TSR", "DEV_TSR_KAT", "DEV_SBI", "DEV_SBI_KAT", 
								"DEV_URB", "DEV_URB_KAT", "$user", public, topology, ;

SHOW search_path;					
					
-- ----------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------
