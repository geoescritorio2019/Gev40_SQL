/*

-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- DOMINIOS PARA LA BASE DE DATOS DE DESARROLLO GEV_DEV
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

*/

-- ---------------------------------------------------------------------------------------------------------------------------------
-- TODOS LOS DOMIIOS SE CREARAN EN "public", CON LA FINALIDAD DE HACERLOS PUBLICOOS, ESTO ES, SERAN USADOS EN TODOS LOS ESQUEMAS. --
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CONTENIDO -----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


-- DOMINIO DE NOMBRES PROPIOS
-- DOMINIO DE DESCRIPCIONES
-- DOMINIO DE NOMBRES DE USUARIOS
-- DOMINIO DEL REGISTRO FEDERAL DE CAUSANTES
-- DOMINIO DE LA CEDULA UNICA DE REGISTRO DE LA POBLACION
-- DOMINIO DEL CORREO ELECTRONICO
-- DOMINIO DE NUMEROS TELEFONICOS NACIONALES
-- DOMINIO DE NUMEROS DE CODIGO POSTAL
-- DOMINIO DE CLAVE DE ELECTOR
-- DOMINIO DE FECHAS ESTANDARES SIN TIME ZONE (TZ)


-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESQUEMA "public" ------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE NOMBRES PROPIOS ------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_Nom CASCADE;

CREATE 	DOMAIN 				"public".Dom_Nom AS     	VARCHAR(254) NOT NULL DEFAULT 'ND' CHECK (value ~ '^[A-ZÑ\s\.]+$');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_Nom			IS 'Dominio de nombres propios';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE DESCRIPCIONES --------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_Des CASCADE;

CREATE 	DOMAIN 				"public".Dom_Des AS     	VARCHAR(255) NOT NULL DEFAULT 'ND' CHECK (value ~ '^[A-ZÑÜa-zñü0-9\(\)\-\s\.\,\_\/\%\"]+$');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_Des			IS 'Dominio de descripciones en general';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE NOMBRES DE USUARIOS --------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_Usr CASCADE;

CREATE 	DOMAIN 				"public".Dom_Usr AS     	VARCHAR(25) NOT NULL DEFAULT 'ND' CHECK (value ~ '^[A-Za-zÑñ_\-\s\.]+');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_Usr			IS 'Dominio de nombres de usuarios';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DEL REGISTRO FEDERAL DE CAUSANTES ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_RFC CASCADE;

CREATE 	DOMAIN 				"public".Dom_RFC AS     VARCHAR(13) NOT NULL DEFAULT 'AAAA999999AA9' CHECK (value ~ E'^[A-Z]{3,4}[0-9]{6}[A-Z]{2}[0-9]$');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_RFC		IS 'Dominio del registro federal de causantes';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE LA CEDULA UNICA DE REGISTRO DE LA POBLACION --------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_CURP CASCADE;

CREATE 	DOMAIN 				"public".Dom_CURP AS     VARCHAR(18) NOT NULL DEFAULT 'AAAA9999999HAAAAA99' CHECK (value ~ E'^[A-Z]{4}[0-9]{6}[HM][A-Z]{5}[0-9]{2}$');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_CURP			IS 'Dominio de la cedula unica de registro de la poblacion';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DEL CORREO ELECTRONICO --------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_EMAIL CASCADE;

CREATE 	DOMAIN 				"public".Dom_EMAIL AS     VARCHAR(254) NOT NULL DEFAULT 'sin@correo.sin' CHECK (value ~ E'[a-zA-Z0-9_%-]+[@][a-z0-9.-]+[.][a-z]{1,2}');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_EMAIL		IS 'Dominio del correo electronico';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE NUMEROS TELEFONICOS NACIONALES ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_TEL CASCADE;

CREATE 	DOMAIN 				"public".Dom_TEL AS  VARCHAR(16) NOT NULL DEFAULT '(99)-99-99-99-99' CHECK (value ~* '[\(]{0,1}[0-9]{2}[\)]{0,1}[.-]{0,1}[0-9]{2}[.-]{0,1}[0-9]{2}[.-]{0,1}[0-9]{2}[.-]{0,1}[0-9]{2}');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_TEL		IS 'Dominio de numeros telefonicos nacionales';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE NUMEROS DE CODIGO POSTAL ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_CP CASCADE;

CREATE 	DOMAIN 				"public".Dom_CP AS  VARCHAR(5) NOT NULL DEFAULT '99999' CHECK (value ~* '[0-9]{5}');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_CP		IS 'Dominio de numeros de codigos postales';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE CLAVE DE ELECTOR -----------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".DOM_INE CASCADE;

CREATE 	DOMAIN 				"public".DOM_INE AS VARCHAR(18) NOT NULL DEFAULT 'AAAAAA99999999H999' CHECK (value ~ E'^[A-Z]{6}[0-9]{8}[HM][0-9]{3}$');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".DOM_INE		IS 'Dominio de claves de elector';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- DOMINIO DE FECHAS ESTANDARES SIN TIME ZONE (TZ) - (REVISAR) --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	DOMAIN if exists 	"public".Dom_FEC CASCADE;

CREATE 	DOMAIN 				"public".Dom_FEC AS  TIMESTAMP NOT NULL DEFAULT NOW(); --CHECK (value ~* '[0-9]{4}[.-][0-9]{2}[.-][0-9]{2}[\s]{1}[0-9]{2}[\:][0-9]{2}[\:][0-9]{2}');

-- Comentarios de tabla y los campos: 

COMMENT ON DOMAIN 			"public".Dom_FEC	IS 'Dominio de fechas estandar';

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
