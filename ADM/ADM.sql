
-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- TABLAS EN EL ESQUEMA DE ADMINISTRACION "ADM"
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL
-- NOTAS: 
-- ESTE ESQUEMA SIRVE PARA ADMINISTRAR LOS GRUPOS DE USUARIOS(PERFILES) Y A LOS USUARIOS, ASI COMO SUS CARACTERISTUICAS.
-- TAMBIEN SE UTILIZA PARA PRESENTAR LAS OPCIONES DE MENU, SEGUN SU PERFIL, Y LOS PERMISOS PARA EJECUTAR LAS APPs O MODULOS.

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CONTENIDO -----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION TABLAS DEL ESQUEMA DE ADMINISTRACION "ADM" ------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- CATALOGO DE DEPENDENCIAS MUNICIPALES O ESTATALES
-- ESTRUCTURA TYPE PARA CATALOGO DE DEPENDENCIAS MUNICIPALES O ESTATALES
-- CATALOGO DE DEPARTAMENTOS O AREAS
-- ESTRUCTURA TYPE PARA CATALOGO DE DEPARTAMENTOS O AREAS
-- CATALOGO DE JORNADA LABORAL
-- ESTRUCTURA TYPE PARA CATALOGO DE JORNADA LABORAL
-- CATALOGO DE MODULOS DEL GEOESCRITORIO VIRTUAL
-- ESTRUCTURA TYPE PARA CATALOGO DE JORNADA LABORAL
-- CATALOGO DE PERFILES O GRUPOS DE USUARIOS
-- ESTRUCTURA TYPE PARA CATALOGO DE JORNADA LABORAL
-- CATALOGO DE PUESTOS
-- ESTRUCTURA TYPE PARA EL CATALOGO DE PUESTOS
-- CATALOGO DE USUARIOS
-- ESTRUCTURA TYPE PARA CATALOGO DE PUESTOS
-- TABLA RESOLUTIVA DE PERFIL CON MODULOS
-- ESTRUCTURA TYPE PARA CATALOGO DE PERFIL CON MODULOS
-- TABLA RESOLUTIVA DE USUARIOS CON PERFIL, DEPARTAMENTO, PUESTO Y JORNADA
-- ESTRUCTURA TYPE TABLA RESOLUTIVA DE USUARIOS CON PERFIL, DEPARTAMENTO, PUESTO Y JORNADA 
-- TABLA RESOLUTIVA DE PERFIL CON AREAS
-- ESTRUCTURA TYPE TABLA RESOLUTIVA DE PERFIL CON AREAS


-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION TIPOS DEL ESQUEMA DE ADMINISTRACION "ADM"--------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- VISTA DE DEPENDENCIAS
-- VISTA DE DEPARTAMENTOS
-- VISTA DE JORNADAS
-- VISTA DE MODULOS
-- VISTA DE PERFILES
-- VISTA DE PERFILES Y MODULOS 
-- VISTA DE PERFILES Y USUARIOS
-- VISTA DE PERFILES Y AREAS
-- VISTA DE PUESTOS
-- VISTA DE USUARIOS

-- VISTA DE USUARIOS CON PERFILES Y PUESTOS PARA LAS SESIONES 

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION PERMISOS PARA EL ESQUEMA DE ADMINISTRACION "ADM" ------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
  
-- PERMISOS PARA PROPIETARIO "ADM" EN SECUENCIAS Y TABLAS (SIN DELETE)
-- PERMISOS PARA USUARIO "FTG", "IDE", "KTT", "TSR", "SBI", "UNI", "URB" EN SECUENCIAS Y EN TABLAS















-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION TABLAS DEL ESQUEMA DE ADMINISTRACION "ADM" ------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE DEPENDENCIAS MUNICIPALES O ESTATALES --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Dependencias CASCADE;

CREATE 	TABLE 				"ADM".Dependencias 
(
	Dep_Cve 				SMALLSERIAL 								,
	Dep_Nom 				"public".Dom_Nom							,
	Dep_Dep 				SMALLINT 		DEFAULT null				,
	Dep_Abr 				VARCHAR(254) 	DEFAULT null				,

	Usr_Cve					VARCHAR(25) 	NOT NULL DEFAULT 'ADM' 		,
	Est_Act 				BOOLEAN 		NOT NULL DEFAULT true 		,
	Fec_Mod 				"public".DOM_FEC							,

	CONSTRAINT 				Dep_Cve_PK 		PRIMARY KEY (Dep_Cve) 		,
	CONSTRAINT 				Dep_Nom_UNQ 	UNIQUE 		(Dep_Nom )		,
	CONSTRAINT 				Dep_Cve_FK_01 	FOREIGN KEY (Dep_Dep ) REFERENCES "ADM".Dependencias ( Dep_Cve ) ON DELETE NO ACTION NOT DEFERRABLE
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Dependencias					IS 'Catalogo de las Dependencias la institucion';
COMMENT ON COLUMN "ADM".Dependencias.Dep_Cve 			IS 'Identificacion de las Dependencias';

COMMENT ON COLUMN "ADM".Dependencias.Dep_Nom 			IS 'Nombre unicos de las Dependencias';
COMMENT ON COLUMN "ADM".Dependencias.Dep_Dep			IS 'Dependencia jerarquicas de las Dependencias' ;
COMMENT ON COLUMN "ADM".Dependencias.Dep_Abr 			IS 'Abreviatura de las Dependencias';

COMMENT ON COLUMN "ADM".Dependencias.Usr_Cve 			IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Dependencias.Est_Act 			IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Dependencias.Fec_Mod 			IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Dep_Cve_PK 						ON "ADM".Dependencias IS 'Llave Primaria de la tabla Dependencias';
COMMENT ON CONSTRAINT Dep_Nom_UNQ 						ON "ADM".Dependencias IS 'Valor unico del campo seleccionado, sin duplicados';
COMMENT ON CONSTRAINT Dep_Cve_FK_01 					ON "ADM".Dependencias IS 'Llave recursiva que apunta a la misma tabla';

ALTER TABLE "ADM".Dependencias OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE DEPENDENCIAS MUNICIPALES O ESTATALES -----------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "ADM".Tpo_Dependencia CASCADE;

CREATE 	TYPE "ADM".Tpo_Dependencia AS 
(
		Dep_Cve 		VARCHAR(254) ,
		Dep_Nom 		VARCHAR(254) ,
		Dep_Abr 		VARCHAR(254)
);

COMMENT ON TYPE "ADM".Tpo_Dependencia IS  'Tipo de dato de la tabla dependencia' ;

ALTER TYPE "ADM".Tpo_Dependencia OWNER TO "ADM";

*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE DEPARTAMENTOS O AREAS -----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"ADM".Departamentos CASCADE;

CREATE 	TABLE 				"ADM".Departamentos 
(
	Dpa_Cve 				SMALLSERIAL 								,
	Dep_Cve 				SMALLINT 		NOT NULL 					,
	Dpa_Nom 				"public".DOM_NOM							,
	Dpa_Dep 				INTEGER 		DEFAULT null				,
	Dpa_Abr 				VARCHAR(254) 	DEFAULT null				,

	Usr_Cve					VARCHAR(25)		NOT NULL DEFAULT 'ADM' 		,
	Est_Act 				BOOLEAN 		NOT NULL DEFAULT true 		,
	Fec_Mod 				"public".DOM_FEC							,

	CONSTRAINT 				Dpa_Cve_PK 		PRIMARY KEY (Dpa_Cve) 		,
	CONSTRAINT 				Dpa_Nom_UNQ 	UNIQUE 		(Dpa_Nom)		,
	CONSTRAINT 				Dep_Cve_FK_02 	FOREIGN KEY (Dep_Cve) REFERENCES "ADM".Dependencias ( Dep_Cve ) ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Dpa_Cve_FK_01 	FOREIGN KEY (Dpa_Dep) REFERENCES "ADM".Departamentos( Dpa_Cve ) ON DELETE NO ACTION NOT DEFERRABLE
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Departamentos				IS 'Catalogo de Departamentos o areas de la institucion o empresa';
COMMENT ON COLUMN "ADM".Departamentos.Dpa_Cve 		IS 'Identificacion de los Departamentos o areas ';
COMMENT ON COLUMN "ADM".Departamentos.Dep_Cve		IS 'Relacion jerarquica con las Dependencias o areas ' ;
COMMENT ON COLUMN "ADM".Departamentos.Dpa_Nom 		IS 'Nombre unicos de los Departamentos o areas ';
COMMENT ON COLUMN "ADM".Departamentos.Dpa_Dep		IS 'Dependencia jerarquicas de los Departamentos' ;

COMMENT ON COLUMN "ADM".Departamentos.Dpa_Abr 		IS '"ADM".Dependencias de los Departamentos o areas ';

COMMENT ON COLUMN "ADM".Departamentos.Usr_Cve 		IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Departamentos.Est_Act 		IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Departamentos.Fec_Mod 		IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Dpa_Cve_PK 					ON "ADM".Departamentos IS 'Llave Primaria de la tabla Departamentos';
COMMENT ON CONSTRAINT Dpa_Nom_UNQ 					ON "ADM".Departamentos IS 'Valor unico del campo seleccionado, sin duplicados';
COMMENT ON CONSTRAINT Dep_Cve_FK_02 				ON "ADM".Departamentos IS 'Llave Foranea que apunta desde la tabla Dependencias';
COMMENT ON CONSTRAINT Dpa_Cve_FK_01 				ON "ADM".Departamentos IS 'Llave recursiva que apunta a la misma tabla';

ALTER TABLE "ADM".Departamentos OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE DEPARTAMENTOS O AREAS --------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".Tpo_Departamento CASCADE;

CREATE 	TYPE "ADM".Tpo_Departamento AS 
(
	Dpa_Cve 				VARCHAR(254),
	Dep_Cve 				VARCHAR(254),

	Dpa_Nom 				VARCHAR(254),
	Dpa_Abr 				VARCHAR(254)
);

COMMENT ON TYPE "ADM".Tpo_Departamento IS  'Tipo de dato de la tabla Departamentos' ;

ALTER TYPE "ADM".Tpo_Departamento OWNER TO "ADM";

*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE JORNADA LABORAL -----------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Jornadas CASCADE;

CREATE 	TABLE 				"ADM".Jornadas 
(
	Jor_Cve 				SMALLSERIAL 									,
	Jor_Des					"public".Dom_Nom								,
	
	Jor_Dia 				BOOLEAN [7] 		NOT NULL 					,	
	Jor_Hor_Ini				TIME 				NOT NULL 					,
	Jor_Hor_Fin				TIME 				NOT NULL 					,

	Usr_Cve					VARCHAR(25)  		NOT NULL DEFAULT 'ADM' 		,
	Est_Act 				BOOLEAN 			NOT NULL DEFAULT true 		,
	Fec_Mod 				"public".DOM_FEC								,

	CONSTRAINT 				Jor_Cve_PK 			PRIMARY KEY (Jor_Cve) 		,
	CONSTRAINT 				Jor_Des_UNQ 		UNIQUE 		(Jor_Des )
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Jornadas					IS 'Catalogo de Jornadas Laborales';
COMMENT ON COLUMN "ADM".Jornadas.Jor_Cve 			IS 'Identificacion de las Jornadas Laborales ';
COMMENT ON COLUMN "ADM".Jornadas.Jor_Des 			IS 'Descripcion de la jornada laboral';
COMMENT ON COLUMN "ADM".Jornadas.Jor_Dia 			IS 'Semana Laboral Lunes: Aplica--true; No aplica--false';
COMMENT ON COLUMN "ADM".Jornadas.Jor_Hor_Ini		IS 'Horario Inicial de labores  ' ;
COMMENT ON COLUMN "ADM".Jornadas.Jor_Hor_Fin 		IS 'Horario Final de Labores ';

COMMENT ON COLUMN "ADM".Jornadas.Usr_Cve 			IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Jornadas.Est_Act 			IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Jornadas.Fec_Mod 			IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Jor_Cve_PK 					ON "ADM".Jornadas IS 'Llave Primaria de la tabla Jornadas';
COMMENT ON CONSTRAINT Jor_Des_UNQ 					ON "ADM".Jornadas IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "ADM".Jornadas OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE JORNADA LABORAL --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".Tpo_Jornada CASCADE;

CREATE 	TYPE "ADM".Tpo_Jornada AS 
(
	Jor_Cve 				VARCHAR(254) 		,
	Jor_Des					VARCHAR(254)		,

	Jor_Dia 				VARCHAR(254)		,
	Jor_Hor_Ini				VARCHAR(254)		,
	Jor_Hor_Fin				VARCHAR(254)
);

COMMENT ON TYPE "ADM".Tpo_Jornada IS  'Tipo de dato de la tabla Jornadas' ;

ALTER TYPE "ADM".Tpo_Jornada OWNER TO "ADM";

*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE MODULOS DEL GEOESCRITORIO VIRTUAL -----------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists		"ADM".Modulos CASCADE;

CREATE 	TABLE 				"ADM".Modulos 
(
	Mod_Cve 				SMALLSERIAL 									,
	Mod_Nom 				"public".Dom_Nom 								,
	Mod_Lik 				VARCHAR(254) 		NOT NULL 					,
	Mod_Img					VARCHAR(254) 		NOT NULL 					,
	Mod_Ord 				SMALLINT 			DEFAULT null				,
	Mod_Nom_Lar 			VARCHAR(254) 		NOT NULL 					,
	Mod_Ver 				TEXT 				DEFAULT null				,
	Mod_Cve_Raiz			SMALLINT 			DEFAULT null				,
	Mod_Ext					BOOLEAN 			NOT NULL 					,
	Mod_Res					SMALLINT 			DEFAULT null				,

	Usr_Cve					VARCHAR(25) 		NOT NULL DEFAULT 'ADM' 		,
	Est_Act 				BOOLEAN 			NOT NULL DEFAULT true 		,
	Fec_Mod 				"public".DOM_FEC								,

	CONSTRAINT 				Mod_Cve_PK 			PRIMARY KEY (Mod_Cve) 			,
	CONSTRAINT 				Mod_Nom_UNQ 		UNIQUE 		( Mod_Nom )
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Modulos						IS 'Catalogo de Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Modulos.Mod_Cve 			IS 'Identificacion de los Modulos del GEV 4.0';

COMMENT ON COLUMN "ADM".Modulos.Mod_Nom 			IS 'Nombre de los Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Modulos.Mod_Lik				IS 'Links  a  los Modulos del GEV 4.0' ;
COMMENT ON COLUMN "ADM".Modulos.Mod_Img				IS 'Imagen de los Modulos del GEV 4.0' ;
COMMENT ON COLUMN "ADM".Modulos.Mod_Ord				IS 'Orden  de los Modulos del GEV 4.0' ;
COMMENT ON COLUMN "ADM".Modulos.Mod_Nom_Lar 		IS 'Nombre largo de los Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Modulos.Mod_Ver 			IS 'Version de los Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Modulos.Mod_Cve_Raiz		IS 'Modulo padre de cada Modulo del GEV 4.0';
COMMENT ON COLUMN "ADM".Modulos.Mod_Ext				IS 'Modulo externo del GEV 4.0';
COMMENT ON COLUMN "ADM".Modulos.Mod_Res				IS 'Restriccion de ejecucion de los "ADM".Modulos del GEV 4.0';

COMMENT ON COLUMN "ADM".Modulos.Usr_Cve 			IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Modulos.Est_Act 			IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Modulos.Fec_Mod 			IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Mod_Cve_PK 					ON "ADM".Modulos IS 'Llave Primaria de la tabla Modulos';
COMMENT ON CONSTRAINT Mod_Nom_UNQ 					ON "ADM".Modulos IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "ADM".Modulos OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE JORNADA LABORAL --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".Tpo_Modulo CASCADE;

CREATE 	TYPE "ADM".Tpo_Modulo AS 
(
	Mod_Cve 				VARCHAR(254) 		,
	Mod_Nom 				VARCHAR(254) 		,
	Mod_Lik 				VARCHAR(254) 		,
	Mod_Img					VARCHAR(254) 		,
	Mod_Ord 				VARCHAR(254) 		,
	Mod_Nom_Lar 			VARCHAR(254) 		,
	Mod_Ver 				VARCHAR(254) 		,
	Mod_Cve_Raiz			VARCHAR(254) 		,
	Mod_Ext					VARCHAR(254) 		,
	Mod_Res					VARCHAR(254) 			
);

COMMENT ON TYPE "ADM".Tpo_Modulo IS  'Tipo de dato de la tabla Modulos' ;

ALTER TYPE "ADM".Tpo_Modulo OWNER TO "ADM";

*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE PERFILES O GRUPOS DE USUARIOS ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Perfiles CASCADE;

CREATE 	TABLE 				"ADM".Perfiles 
(
	Per_Cve 				SMALLSERIAL 									,
	Per_Nom 				"public".Dom_Nom								,
	Per_Des 				VARCHAR(254) 		NOT NULL 					,
	Per_Res 				INTEGER 			DEFAULT null				,
	Per_Com 				TEXT 				DEFAULT null				,

	Usr_Cve					VARCHAR(25) 		NOT NULL DEFAULT 'ADM' 		,
	Est_Act 				BOOLEAN 			NOT NULL DEFAULT true 		,
	Fec_Mod 				"public".DOM_FEC								,

	CONSTRAINT 				Per_Cve_PK 			PRIMARY KEY (Per_Cve) 		,
	CONSTRAINT 				Per_Nom_UNQ 		UNIQUE 		( Per_Nom )
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Perfiles				IS 'Catalogo de Perfiles o Grupos de Usuarios';
COMMENT ON COLUMN "ADM".Perfiles.Per_Cve 		IS 'Identificacion de los Perfiles o Grupos de Usuarios';

COMMENT ON COLUMN "ADM".Perfiles.Per_Nom 		IS 'Nombre unico de los Perfiles o Grupos de Usuarios';
COMMENT ON COLUMN "ADM".Perfiles.Per_Des		IS 'Descripcion de los Perfiles o Grupos de Usuarios' ;
COMMENT ON COLUMN "ADM".Perfiles.Per_Res 		IS 'Restricciones de usos de los Perfiles o Grupos de Usuarios';
COMMENT ON COLUMN "ADM".Perfiles.Per_Com 		IS 'Comentarios a los Perfiles o Grupos de Usuarios';

COMMENT ON COLUMN "ADM".Perfiles.Usr_Cve 		IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Perfiles.Est_Act 		IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Perfiles.Fec_Mod 		IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Per_Cve_PK 				ON "ADM".Perfiles IS 'Llave Primaria de la tabla Perfiles';
COMMENT ON CONSTRAINT Per_Nom_UNQ 				ON "ADM".Perfiles IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "ADM".Perfiles OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE JORNADA LABORAL --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".Tpo_Perfil CASCADE;

CREATE 	TYPE "ADM".Tpo_Perfil AS 
(
	Per_Cve 				VARCHAR(254) 		,
	Per_Nom 				VARCHAR(254) 		,
	Per_Des 				VARCHAR(254) 		,
	Per_Res					VARCHAR(254) 		,
	Per_Com 				VARCHAR(254)		
);

COMMENT ON TYPE "ADM".Tpo_Perfil IS  'Tipo de dato de la tabla Perfiles' ;

ALTER TYPE "ADM".Tpo_Perfil OWNER TO "ADM";
*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE PUESTOS -------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Puestos CASCADE;

CREATE 	TABLE 				"ADM".Puestos 
(
	Pue_Cve 				SMALLSERIAL 								,
	Pue_Des					"public".DOM_NOM							,
	Pue_Prior 				INTEGER 			DEFAULT null			,
	
	Usr_Cve					VARCHAR(25) 		NOT NULL DEFAULT 'ADM' 	,
	Est_Act 				BOOLEAN 			NOT NULL DEFAULT true 	,
	Fec_Mod 				"public".DOM_FEC							,

	CONSTRAINT 				Pue_Cve_PK 			PRIMARY KEY ( Pue_Cve ) ,
	CONSTRAINT 				Pue_Des_UNQ 		UNIQUE 		( Pue_Des )
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Puestos					IS 'Catalogo de Puestos de la institucion o empresa';
COMMENT ON COLUMN "ADM".Puestos.Pue_Cve 		IS 'Identificacion de los Puestos de la institucion o empresa ';
COMMENT ON COLUMN "ADM".Puestos.Pue_Des 		IS 'Nombre unico de los Puestos de la institucion o empresa';
COMMENT ON COLUMN "ADM".Puestos.Pue_Prior 		IS 'Orden  de prelacion de los Puestos de la institucion o empresa agregar NOTIFICADOR';

COMMENT ON COLUMN "ADM".Puestos.Usr_Cve 		IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Puestos.Est_Act 		IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Puestos.Fec_Mod 		IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Pue_Cve_PK 				ON "ADM".Puestos IS 'Llave Primaria de la tabla Puestos';
COMMENT ON CONSTRAINT Pue_Des_UNQ 				ON "ADM".Puestos IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "ADM".Puestos OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA EL CATALOGO DE PUESTOS -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".Tpo_Puesto CASCADE;

CREATE 	TYPE "ADM".Tpo_Puesto AS 
(
	Pue_Cve 				SMALLINT 			,
	Pue_Des					VARCHAR(254) 		,
	Pue_Prior 				VARCHAR(254) 	
);

COMMENT ON TYPE "ADM".Tpo_Puesto IS  'Tipo de dato de la tabla Puestos' ;

ALTER TYPE "ADM".Tpo_Puesto OWNER TO "ADM";

*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE USUARIOS ------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Usuarios CASCADE;

CREATE 	TABLE 				"ADM".Usuarios 
(
	Usu_Id 					SMALLSERIAL 										,

	Usu_Usr 				"public".DOM_USR 									,
	Usu_Pas 				VARCHAR(254) 		NOT NULL 						,
	
	Edo_Id 					SMALLINT 			NOT NULL						,
	Reg_Cat_Id 				SMALLINT 			NOT NULL						,
	Mun_Id 					SMALLINT 			NOT NULL						,
	Loc_Id 					SMALLINT 			DEFAULT null					,
	
	Usu_Tpo_Usr				BOOLEAN 			NOT NULL DEFAULT true 			,
	Usu_Pat 				"public".DOM_NOM 									,
	Usu_Mat 				"public".DOM_NOM 									,
	Usu_Nom 				"public".DOM_NOM 									,
	Usu_Aut_Quita 			BOOLEAN 			NOT NULL DEFAULT false			,

	Usu_Tel 				"public".DOM_TEL 									,
	Usu_Ext 				VARCHAR(254) 		DEFAULT null					,
	Usu_Mac					MACADDR 			DEFAULT null					,
	Usu_Email 				"public".DOM_EMAIL 									,
	Usu_Smtp_host 			VARCHAR(254) 		COLLATE pg_catalog.default		,
	Usu_Smtp_Pto 			INTEGER				DEFAULT null					,
	Usu_Ubi 				VARCHAR(254) 		DEFAULT null					,
	Usu_Obs 				VARCHAR(254) 		DEFAULT null					,
	Usu_Adm 				BOOLEAN 			NOT NULL DEFAULT false			,

	Usu_Fot 				BYTEA 				DEFAULT null					,
	Usu_Arc 				BYTEA 				DEFAULT null					,
	Usu_Xet 				VARCHAR(254) 		DEFAULT null					,

	Usr_Cve					VARCHAR(25) 		NOT NULL DEFAULT 'ADM' 			,
	Est_Act 				BOOLEAN 			NOT NULL DEFAULT true 			,
	Fec_Mod 				"public".DOM_FEC									,

	CONSTRAINT 				Usu_Id_PK 			PRIMARY KEY (Usu_Id) 			,
	CONSTRAINT 				Usu_Des_UNQ 		UNIQUE (Usu_Pat, Usu_Mat, Usu_Nom)
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Usuarios						IS 'Catalogo de los Usuarios del sistema';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Id 				IS 'Identificacion de los Usuarios del sistema';

COMMENT ON COLUMN "ADM".Usuarios.Usu_Usr 				IS 'Nombre o alias de los Usuarios del sistema';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Pas				IS 'Descripcion de los Usuarios del sistema' ;

COMMENT ON COLUMN "ADM".Usuarios.Edo_Id 				IS 'Identificacion foranea INEGI de la entidad federativa';
COMMENT ON COLUMN "ADM".Usuarios.Reg_Cat_Id 			IS 'Identificacion foranea de la region catastral, valor por omision 1';
COMMENT ON COLUMN "ADM".Usuarios.Mun_Id 				IS 'Identificacion foranea INEGI del municipio';
COMMENT ON COLUMN "ADM".Usuarios.Loc_Id 				IS 'Identificacion foranea INEGI de la localidad';

COMMENT ON COLUMN "ADM".Usuarios.Usu_Tpo_Usr			IS 'Tipo de usuario: True = INTERNO; FALSE = EXTERNO';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Pat 				IS 'Apellido paterno del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Mat 				IS 'Apellido materno del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Nom 				IS 'Nombre del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Aut_Quita 			IS 'Funcionario autorizado para aplicar quitas de accesorios en TSR-CIP';

COMMENT ON COLUMN "ADM".Usuarios.Usu_Tel 				IS 'Telefono oficial del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Ext 				IS 'Extension del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Mac 				IS 'Macaddress del equipo de trabajo del usuario';

COMMENT ON COLUMN "ADM".Usuarios.Usu_Email 				IS 'Correo electronico oficial del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Smtp_host 			IS 'Dominio SMTP del correo electronico oficial del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Smtp_Pto 			IS 'Puerto SMTP del dominio Correo electronico oficial del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Ubi 				IS 'Ubicacion del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Obs 				IS 'Observaciones al usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Adm 				IS 'Es administrador el usuario';

COMMENT ON COLUMN "ADM".Usuarios.Usu_Fot 				IS 'Fotografia del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Arc 				IS 'Archivo de firma electronica del usuario';
COMMENT ON COLUMN "ADM".Usuarios.Usu_Xet 				IS 'Extension del archivo de firma electronica del usuario';

COMMENT ON COLUMN "ADM".Usuarios.Usr_Cve 				IS 'Ultimo usuario que administro el Catálogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "ADM".Usuarios.Est_Act 				IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "ADM".Usuarios.Fec_Mod 				IS 'Fecha de la ultima operacion de actualizacion del Catálogo';

COMMENT ON CONSTRAINT Usu_Id_PK 						ON "ADM".Usuarios IS 'Llave Primaria de la tabla Usuarios';
COMMENT ON CONSTRAINT Usu_Des_UNQ 						ON "ADM".Usuarios IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "ADM".Usuarios OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE PUESTOS ----------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".Tpo_Usuario CASCADE;

CREATE 	TYPE "ADM".Tpo_Usuario AS 
(
	Usu_Id 					VARCHAR(254) 					,

	Usu_Usr 				VARCHAR(254) 					,
	Usu_Pas 				VARCHAR(254) 					,
	
	Edo_Id 					VARCHAR(254) 					,
	Reg_Cat_Id 				VARCHAR(254) 					,
	Mun_Id 					VARCHAR(254) 					,
	Loc_Id 					VARCHAR(254) 					,
	
	Usu_Tpo_Usr				VARCHAR(254) 					,
	Usu_Pat 				VARCHAR(254) 					,
	Usu_Mat 				VARCHAR(254) 					,
	Usu_Nom 				VARCHAR(254) 					,
	Usu_Aut_Quita 			VARCHAR(254) 					,

	Usu_Tel 				VARCHAR(254) 					,
	Usu_Ext 				VARCHAR(254) 					,
	Usu_Mac					VARCHAR(254) 					,
	Usu_Email 				VARCHAR(254) 					,
	Usu_Smtp_host 			VARCHAR(254) 					,
	Usu_Smtp_Pto 			VARCHAR(254) 					,
	Usu_Ubi 				VARCHAR(254) 					,
	Usu_Obs 				VARCHAR(254) 					,
	Usu_Adm 				VARCHAR(254) 					,
	Usu_Fot 				VARCHAR(254) 					,
	Usu_Arc 				VARCHAR(254) 					,
	Usu_Xet 				VARCHAR(254) 
);

COMMENT ON TYPE "ADM".Tpo_Usuario IS  'Tipo de dato de la tabla Usuarios' ;

ALTER TYPE "ADM".Tpo_Usuario OWNER TO "ADM";
*/

-- ---------------------------------------------------------------------------------------------------------------------------------
-- TABLA RESOLUTIVA DE PERFIL CON MODULOS ------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Res_Perfiles_Modulos CASCADE;

CREATE 	TABLE 				"ADM".Res_Perfiles_Modulos 
(
	Per_Mod_Con 			SMALLSERIAL 								,

	Per_Cve 				SMALLINT 		NOT NULL 					,
	Mod_Cve 				SMALLINT 		NOT NULL 					,
	Per_Mod_Est 			BOOLEAN 		NOT NULL DEFAULT true 		,

	CONSTRAINT 				Per_Mod_Con_PK 	PRIMARY KEY ( Per_Mod_Con )	,
	CONSTRAINT 				Per_Cve_FK_01 	FOREIGN KEY ( Per_Cve ) 	REFERENCES "ADM".Perfiles (Per_Cve) ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Mod_Cve_FK_01 	FOREIGN KEY ( Mod_Cve ) 	REFERENCES "ADM".Modulos  (Mod_Cve) ON DELETE NO ACTION NOT DEFERRABLE
)
WITH (OIDS=FALSE);

-- Indices de la tabla:

-- DROP 	INDEX if exists Per_Mod_Con_IDX CASCADE;

CREATE 	INDEX 			Per_Mod_Con_IDX ON "ADM".Res_Perfiles_Modulos USING BTREE (Per_Cve,  Mod_Cve );

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Res_Perfiles_Modulos					IS 'Catalogo de Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Res_Perfiles_Modulos.Per_Mod_Con 		IS 'Identificacion de los Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Res_Perfiles_Modulos.Per_Cve 			IS 'Identificacion de los Perfiles o Grupos de Usuarios';
COMMENT ON COLUMN "ADM".Res_Perfiles_Modulos.Mod_Cve 			IS 'Identificacion de los Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Res_Perfiles_Modulos.Per_Mod_Est 		IS 'Estatus de la relacion Perfiles contra Modulos';

COMMENT ON CONSTRAINT Per_Mod_Con_PK 							ON "ADM".Res_Perfiles_Modulos IS 'Llave Primaria de la tabla Res_Perfiles_Modulos';
COMMENT ON CONSTRAINT Per_Cve_FK_01 							ON "ADM".Res_Perfiles_Modulos IS 'Llave Foranea que apunta desde la tabla Perfiles';
COMMENT ON CONSTRAINT Mod_Cve_FK_01 							ON "ADM".Res_Perfiles_Modulos IS 'Llave Foranea que apunta desde la tabla Modulos';

COMMENT ON INDEX "ADM".Per_Mod_Con_IDX 							IS 'Indice de la resolucion entre perfiles y modulos';

ALTER TABLE "ADM".Res_Perfiles_Modulos OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA CATALOGO DE PERFIL CON MODULOS -----------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".tpo_perfil_modulo CASCADE;

CREATE 	TYPE "ADM".tpo_perfil_modulo AS 
(
	Per_Cve 				VARCHAR(254) 		,
	Per_Nom 				VARCHAR(254) 		,
	Per_Des 				VARCHAR(254) 		,
	Per_Res					VARCHAR(254) 		,
	Per_Com 				VARCHAR(254) 		,		

	Mod_Cve 				VARCHAR(254) 		,		
	Mod_Nom 				VARCHAR(254) 		,
	Mod_Lik 				VARCHAR(254) 		,
	Mod_Img					VARCHAR(254) 		,
	Mod_Ord 				VARCHAR(254) 		,
	Mod_Nom_Lar 			VARCHAR(254) 		,
	Mod_Ver 				VARCHAR(254) 		,
	Mod_Cve_Raiz			VARCHAR(254) 		,
	Mod_Ext					VARCHAR(254) 		,
	Mod_Res					VARCHAR(254)
);

COMMENT ON TYPE "ADM".tpo_perfil_modulo IS  'Tipo de dato de la tabla Perfiles' ;
*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- TABLA RESOLUTIVA DE USUARIOS CON PERFIL, DEPARTAMENTO, PUESTO Y JORNADA ---------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Res_Perfiles_Usuarios CASCADE;

CREATE 	TABLE 				"ADM".Res_Perfiles_Usuarios 
(
	Per_Usr_Con				SMALLSERIAL 								,
	
	Per_Cve 				SMALLINT 			NOT NULL 				,	
	Dpa_Cve 				SMALLINT 			NOT NULL 				,	
	Pue_Cve 				SMALLINT 			NOT NULL 				,
	Jor_Cve					SMALLINT 			NOT NULL 				,
	Usu_Id 					SMALLINT 			NOT NULL 				,

	Per_Usr_Fec_Ini_Pos 	"public".DOM_FEC 							,			
	Per_Usr_Fec_Fin_Pos 	TIMESTAMP 			DEFAULT null			,
	Per_Usr_Est_Act 		BOOLEAN 			NOT NULL DEFAULT true 	,

	CONSTRAINT 				Per_Usr_Con_PK 	PRIMARY KEY (Per_Usr_Con) 	,
	CONSTRAINT 				Per_Cve_FK_02	FOREIGN KEY (Per_Cve) 	REFERENCES "ADM".Perfiles 		(Per_Cve) ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Dpa_Cve_FK_02 	FOREIGN KEY (Dpa_Cve) 	REFERENCES "ADM".Departamentos 	(Dpa_Cve) ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Pue_Cve_FK_01 	FOREIGN KEY (Pue_Cve) 	REFERENCES "ADM".Puestos 		(Pue_Cve) ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Jor_Cve_FK_01 	FOREIGN KEY (Jor_Cve)	REFERENCES "ADM".Jornadas 		(Jor_Cve) ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Usu_Id_FK_01 	FOREIGN KEY (Usu_Id) 	REFERENCES "ADM".Usuarios 		(Usu_Id)  ON DELETE NO ACTION NOT DEFERRABLE
)
WITH (OIDS=FALSE);

-- Indices de la tabla:

-- DROP 	INDEX if exists Per_Usr_Con_IDX CASCADE;

CREATE 	INDEX 			Per_Usr_Con_IDX ON "ADM".Res_Perfiles_Usuarios USING BTREE (Dpa_Cve,  Per_Cve, Pue_Cve );

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Res_Perfiles_Usuarios							IS 'Tabla resolutiva de Usuarios con perfil, departamento y puesto';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Per_Usr_Con 				IS 'Identificacion de los Usuarios con perfil, departamento y puesto';

COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Per_Cve 					IS 'Identificacion del Perfil o Grupo de Usuarios asignado al usuario';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Dpa_Cve 					IS 'Identificacion del Departamento o area asignada al usuario';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Pue_Cve 					IS 'Identificacion del Puesto de la institucion o empresa asignado al usuario';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Jor_Cve 					IS 'Identificacion de la Jornada Laboral asignada al usuario';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Usu_Id 					IS 'Identificacion del usuario del sistema';

COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Per_Usr_Fec_Ini_Pos 		IS 'Fecha de Alta en el Puesto';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Per_Usr_Fec_Fin_Pos 		IS 'Fecha de Baja en el Puesto';
COMMENT ON COLUMN "ADM".Res_Perfiles_Usuarios.Per_Usr_Est_Act 			IS 'Estado del usuario en este perfil, departamento y puesto: Activo o Inactivo';

COMMENT ON CONSTRAINT Per_Usr_Con_PK 									ON "ADM".Res_Perfiles_Usuarios IS 'Llave Primaria de la tabla Res_Perfiles_Usuarios';
COMMENT ON CONSTRAINT Per_Cve_FK_02 									ON "ADM".Res_Perfiles_Usuarios IS 'Llave Foranea que apunta desde la tabla Perfiles';
COMMENT ON CONSTRAINT Dpa_Cve_FK_02 									ON "ADM".Res_Perfiles_Usuarios IS 'Llave Foranea que apunta desde la tabla Departamentos';
COMMENT ON CONSTRAINT Pue_Cve_FK_01 									ON "ADM".Res_Perfiles_Usuarios IS 'Llave Foranea que apunta desde la tabla Puestos';
COMMENT ON CONSTRAINT Jor_Cve_FK_01 									ON "ADM".Res_Perfiles_Usuarios IS 'Llave Foranea que apunta desde la tabla Jornadas';
COMMENT ON CONSTRAINT Usu_Id_FK_01 										ON "ADM".Res_Perfiles_Usuarios IS 'Llave Foranea que apunta desde la tabla Usuarios';

COMMENT ON INDEX "ADM".Per_Usr_Con_IDX 									IS 'Indice de la resolucion entre usuarios con perfil, departamento, puesto y jornada';

ALTER TABLE "ADM".Res_Perfiles_Usuarios OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE TABLA RESOLUTIVA DE USUARIOS CON PERFIL, DEPARTAMENTO, PUESTO Y JORNADA -----------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists "ADM".tpo_perfil_usuario CASCADE;

CREATE 	TYPE "ADM".tpo_perfil_usuario AS 
(
	Per_Cve 				VARCHAR(254) 		,
	Per_Nom 				VARCHAR(254) 		,
	Per_Des 				VARCHAR(254) 		,
	Per_Res					VARCHAR(254) 		,
	Per_Com 				VARCHAR(254) 		,		

	Usu_Id 					VARCHAR(254) 		,

	Usu_Usr 				VARCHAR(254) 		,
	Usu_Pas 				VARCHAR(254) 		,
	
	Edo_Id 					VARCHAR(254) 		,
	Reg_Cat_Id 				VARCHAR(254) 		,
	Mun_Id 					VARCHAR(254) 		,
	Loc_Id 					VARCHAR(254) 		,
	
	Usu_Tpo_Usr				VARCHAR(254) 		,
	Usu_Pat 				VARCHAR(254) 		,
	Usu_Mat 				VARCHAR(254) 		,
	Usu_Nom 				VARCHAR(254) 		,
	Usu_Aut_Quita 			VARCHAR(254) 		,

	Usu_Tel 				VARCHAR(254) 		,
	Usu_Ext 				VARCHAR(254) 		,
	Usu_Mac					VARCHAR(254) 		,
	Usu_Email 				VARCHAR(254) 		,
	Usu_Smtp_host 			VARCHAR(254) 		,
	Usu_Smtp_Pto 			VARCHAR(254) 		,
	Usu_Ubi 				VARCHAR(254) 		,
	Usu_Obs 				VARCHAR(254) 		,
	Usu_Adm 				VARCHAR(254) 		,
	Usu_Fot 				VARCHAR(254) 		,
	Usu_Arc 				VARCHAR(254) 		,
	Usu_Xet 				VARCHAR(254) 
);

COMMENT ON TYPE "ADM".tpo_perfil_usuario IS  'Tipo de dato de la tabla Perfiles' ;
*/


-- ---------------------------------------------------------------------------------------------------------------------------------
-- TABLA RESOLUTIVA DE PERFIL CON AREAS --------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	TABLE if exists 	"ADM".Res_Perfiles_Areas CASCADE;

CREATE 	TABLE 				"ADM".Res_Perfiles_Areas 
(
	Per_Dpa_Con 			SMALLSERIAL 									,

	Per_Cve 				SMALLINT 			NOT NULL 					,
	Dpa_Cve 				SMALLINT 			NOT NULL 					,
	Per_Dep_Est 			BOOLEAN 			NOT NULL DEFAULT true 		,

	CONSTRAINT 				Per_Dpa_Con_PK 	PRIMARY KEY (Per_Dpa_Con )		,
	CONSTRAINT 				Per_Cve_FK_01 	FOREIGN KEY (Per_Cve ) 	REFERENCES "ADM".Perfiles 			(Per_Cve) 	ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Dpa_Cve_FK_01 	FOREIGN KEY (Dpa_Cve ) 	REFERENCES "ADM".Departamentos 		(Dpa_Cve)  	ON DELETE NO ACTION NOT DEFERRABLE
)
WITH (OIDS=FALSE);

-- Indices de la tabla:

-- DROP 	INDEX if exists Per_Dpa_Con_IDX CASCADE;

CREATE 	INDEX 			Per_Dpa_Con_IDX ON "ADM".Res_Perfiles_Areas USING BTREE (Per_Cve,  Dpa_Cve );

COMMENT ON INDEX Per_Dpa_Con_IDX 							IS 'Indice de la resolucion entre perfiles y modulos';

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "ADM".Res_Perfiles_Areas					IS 'Tabla Resolutiva de Perfiles con Areas';
COMMENT ON COLUMN "ADM".Res_Perfiles_Areas.Per_Dpa_Con 		IS 'Identificacion de los Modulos del GEV 4.0';
COMMENT ON COLUMN "ADM".Res_Perfiles_Areas.Per_Cve 			IS 'Identificacion de los Perfiles o Grupos de Usuarios';
COMMENT ON COLUMN "ADM".Res_Perfiles_Areas.Dpa_Cve 			IS 'Identificacion de los Departamentos';
COMMENT ON COLUMN "ADM".Res_Perfiles_Areas.Per_Dep_Est 		IS 'Estatus de la relacion de Perfiles con Areas';

COMMENT ON CONSTRAINT Per_Dpa_Con_PK 						ON "ADM".Res_Perfiles_Areas IS 'Llave Primaria de la tabla Res_Perfiles_Areas';
COMMENT ON CONSTRAINT Per_Cve_FK_01 						ON "ADM".Res_Perfiles_Areas IS 'Llave Foranea que apunta desde la tabla Perfiles';
COMMENT ON CONSTRAINT Dpa_Cve_FK_01 						ON "ADM".Res_Perfiles_Areas IS 'Llave Foranea que apunta desde la tabla Departamentos';

ALTER TABLE "ADM".Res_Perfiles_Areas OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE TABLA RESOLUTIVA DE PERFIL CON AREAS ----------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
-- DROP 	TYPE if exists Tpo_Perfil_Area CASCADE;

CREATE 	TYPE Tpo_Perfil_Area AS 
(
	Per_Dpa_Con 			VARCHAR(254) 		,
	Per_Cve 				VARCHAR(254) 		,
	Per_Des 				VARCHAR(254) 		,
	Dpa_Cve 				VARCHAR(254) 		,
	Dpa_Nom 				VARCHAR(254) 		,
	Per_Dep_Est				VARCHAR(254)
);

COMMENT ON TYPE Tpo_Perfil_Area IS  'Tipo de dato de la tabla Perfiles' ;


*/


-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE USUARIOS CON PERFILES Y PUESTOS PARA LAS SESIONES ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 	MATERIALIZED	VIEW if exists 	"ADM".VW_Qry_Usr_Sesion CASCADE;

CREATE	MATERIALIZED	VIEW 			"ADM".VW_Qry_Usr_Sesion AS

SELECT
	
	T1.Per_Usr_Con						AS Id_Consecutivo	,
	
	T1.Per_Cve 							AS Id_Perfil 		,
	UPPER(TRIM(T2.Per_Nom)) 			AS Perfil 			,
	
	T3.Dep_Cve 							AS Id_Dependencia 	,	
	UPPER(TRIM(T4.Dep_Nom))				AS Dependencia 		,
	
	T1.Dpa_Cve 							AS Id_Depto 		,	
	UPPER(TRIM(T3.Dpa_Nom))				AS Depto 			,	
	T1.Pue_Cve 							AS Id_Puesto 		,
	UPPER(TRIM(T5.Pue_Des))				AS Puesto 			,		
	T1.Jor_Cve 							AS Id_Jornada		,
	UPPER(TRIM(T6.Jor_Des))				AS Jornada 			,		
	T6.Jor_Hor_Ini						AS Hor_Inicio 		,
	T6.Jor_Hor_Fin						AS Hor_Final 		,
	
	T1.Usu_Id 							AS Id_Usuario 		,	
	TRIM(T7.Usu_Usr)					AS Usuario			,
	
	UPPER(TRIM(T7.Usu_Pat))	 			AS Paterno 			,
	UPPER(TRIM(T7.Usu_Mat))				AS Materno 			,				
	UPPER(TRIM(T7.Usu_Nom))				AS Nombre 			,
	TRIM((T7.Usu_Email) )				AS Email 			,
	UPPER(TRIM(T7.Usu_Smtp_host))		AS Smtp 			,
	T7.Usu_Smtp_Pto 					AS Puerto			,
	T7.Usu_Fot 							AS Foto 			,
	T7.Usu_Arc 							AS Firma_Electronica, 
			
	to_char(T1.Per_Usr_Fec_Ini_Pos,'YYYY/MM/DD') AS Fec_Ini ,
	to_char(T1.Per_Usr_Fec_Fin_Pos,'YYYY/MM/DD') AS Fec_Fin		
				
FROM "ADM".Res_Perfiles_Usuarios 		AS T1

LEFT OUTER JOIN	"ADM".Perfiles 			AS T2 ON T1.Per_Cve = T2.Per_Cve

LEFT OUTER JOIN	"ADM".Departamentos 	AS T3 ON T1.Dpa_Cve = T3.Dpa_Cve

LEFT OUTER JOIN	"ADM".Dependencias 		AS T4 ON T3.Dep_Cve = T4.Dep_Cve

LEFT OUTER JOIN	"ADM".Puestos 			AS T5 ON T1.Pue_Cve = T5.Pue_Cve

LEFT OUTER JOIN	"ADM".Jornadas 			AS T6 ON T1.Jor_Cve = T6.Jor_Cve

LEFT OUTER JOIN	"ADM".Usuarios 			AS T7 ON T1.Usu_Id  = T7.Usu_Id

WHERE	T1.Per_Usr_Est_Act 	IS true 							AND
		T7.Est_Act	   		IS true 							AND 
		T6.Jor_Dia[(extract (dow from CURRENT_DATE)::integer)] 	AND
		CURRENT_TIME BETWEEN T6.Jor_Hor_Ini AND T6.Jor_Hor_Fin

ORDER BY Id_Perfil, Id_Depto, Id_Puesto, Id_Usuario;

--WITH DATA;

-- DROP 			INDEX if exists Usu_Id_IDX CASCADE;

CREATE 	UNIQUE 	INDEX 			Usu_Id_IDX ON "ADM".VW_Qry_Usr_Sesion (Id_Consecutivo);

REFRESH MATERIALIZED VIEW CONCURRENTLY "ADM".VW_Qry_Usr_Sesion;

-- Comentarios de vista y los campos: 

COMMENT ON MATERIALIZED VIEW   "ADM".VW_Qry_Usr_Sesion					IS 'Vista de los Usuarios y sus relaciones, DEVUELVE un usuario vigente con derecho a entra en el dia y el horario indicaos.';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Consecutivo	IS 'Identificacion de los Usuarios con perfil, departamento, puesto y jornada';

COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Perfil 		IS 'Identificacion de los Perfiles o Grupos de Usuarios';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Perfil 			IS 'Nombre de los Perfiles o Grupos de Usuarios';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Dependencia 	IS 'Identificacion de las Dependencias';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Dependencia 		IS 'Nombre de de las Dependencias';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Depto 		IS 'Identificacion de los Departamentos o areas ';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Depto 			IS 'Nombre de los  Departamentos o areas ';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Puesto 		IS 'Identificacion de los Puestos de la institucion o empresa' ;
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Puesto 			IS 'Nombre de los Puestos de la institucion o empresa';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Jornada 		IS 'Identificacion de las jornadas de la institucion' ;
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Jornada 			IS 'Jornadas de la institucion' ;
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Hor_Inicio 		IS 'Fecha de Alta en el Puesto';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Hor_Final 		IS 'Fecha de Baja en el Puesto';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Id_Usuario 		IS 'Identificacion de los Usuarios del sistema';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Usuario 			IS 'Credencial de los Usuarios del sistema';

COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Paterno 			IS 'Apellido paterno del usuario';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Materno			IS 'Apellido materno del usuario';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Nombre 			IS 'Nombre del usuario';

COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Email 			IS 'Correo electronico del usuario';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Smtp 			IS 'SMTP del usuario';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Puerto 			IS 'Puerto par el SMTO';
COMMENT ON 				COLUMN "ADM".VW_Qry_Usr_Sesion.Foto 			IS 'Fotografia del usuario';

ALTER MATERIALIZED VIEW "ADM".VW_Qry_Usr_Sesion OWNER TO "ADM"; 

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE DEPENDENCIAS -----------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Dependencia CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Dependencia AS

SELECT 
		T1.Dep_Cve 						AS dep_Cve	, 
		UPPER(TRIM(T1.Dep_nom)::text)  	AS Dependencia	, 
		UPPER(TRIM(T1.Dep_abr)::text)  	AS Abr_Dependencia
		
FROM 	"ADM".Dependencias AS T1

WHERE	T1.Est_Act IS true 

ORDER BY dep_Cve;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Dependencia					IS 'Vista de la Dependencias del Ayuntamiento';
COMMENT ON COLUMN "ADM".VW_Qry_Dependencia.dep_Cve			IS 'Clave de la dependencia' ;
COMMENT ON COLUMN "ADM".VW_Qry_Dependencia.Dependencia 		IS 'Dependencia';
COMMENT ON COLUMN "ADM".VW_Qry_Dependencia.Abr_Dependencia 	IS 'Abreviatura de la dependencia';

ALTER VIEW "ADM".VW_Qry_Dependencia OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE DEPARTAMENTOS ----------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Departamento CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Departamento AS

SELECT 
		T1.Dep_Cve 							AS dep_Cve			, 
		UPPER(TRIM(T1.Dep_nom)::text)  		AS Dependencia		, 
		UPPER(TRIM(T1.Dep_abr)::text)  		AS Abr_Dependencia  ,

		T2.Dpa_Cve 							AS dpa_Cve			,
		UPPER(TRIM(T2.Dpa_Nom)::text) 		AS Departamento		, 
		UPPER(TRIM(T2.Dpa_Abr)::text) 		AS Abr_Departamento
		
FROM 	"ADM".Dependencias AS T1, "ADM".Departamentos AS T2

WHERE	T1.Dep_Cve = T2.Dep_Cve AND T1.Est_Act IS true AND T2.Est_Act is true 

ORDER BY T1.dep_Cve, T2.dpa_Cve;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Departamento						IS 'Vista de los departamentos de cada Dependencias del Ayuntamiento';
COMMENT ON COLUMN "ADM".VW_Qry_Departamento.dep_Cve				IS 'Clave de la dependencia' ;
COMMENT ON COLUMN "ADM".VW_Qry_Departamento.Dependencia 		IS 'Dependencia';
COMMENT ON COLUMN "ADM".VW_Qry_Departamento.Abr_Dependencia 	IS 'Abreviatura de la dependencia';

COMMENT ON COLUMN "ADM".VW_Qry_Departamento.dpa_Cve				IS 'Clave del departamento' ;
COMMENT ON COLUMN "ADM".VW_Qry_Departamento.Departamento 		IS 'Departamento';
COMMENT ON COLUMN "ADM".VW_Qry_Departamento.Abr_Departamento 	IS 'Abreviatura del departamento';


ALTER VIEW "ADM".VW_Qry_Dependencia OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE JORNADAS ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Jornada CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Jornada AS

 SELECT 
		T1.Jor_Cve 					AS Jor_Cve,
		T1.Jor_Des					AS Jornada,

		T1.Jor_Dia 					AS Dias,
		T1.Jor_Hor_Ini				AS Hora_Inicial,
		T1.Jor_Hor_Fin				AS Hora_Final

   FROM "ADM".Jornadas AS t1
	
  WHERE  T1.Est_Act IS TRUE
  
  ORDER BY Jor_Cve;

-- Comentarios de vista y los campos: 
  
COMMENT ON  VIEW  "ADM".VW_Qry_Jornada					IS 'Vista de las Jornadas';
COMMENT ON COLUMN "ADM".VW_Qry_Jornada.Jor_Cve			IS 'Clave de las Jornadas' ;
COMMENT ON COLUMN "ADM".VW_Qry_Jornada.Jornada 			IS 'Jornadas';
COMMENT ON COLUMN "ADM".VW_Qry_Jornada.Dias 			IS 'Dias de las Jornadas';
COMMENT ON COLUMN "ADM".VW_Qry_Jornada.Hora_Inicial 	IS 'Hora inicla de las Jornadas';
COMMENT ON COLUMN "ADM".VW_Qry_Jornada.Hora_Final 		IS 'Hora final de las Jornadas';

ALTER VIEW "ADM".VW_Qry_Jornada OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE MODULOS ----------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Modulo CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Modulo AS

 SELECT 
 		T1.Mod_Cve						AS Iden,
		UPPER(TRIM((T1.Mod_nom)::text)) AS Modulo,
		T1.Mod_ord 						AS Orden,
		T1.Mod_Cve_raiz 				AS Raiz
	
   FROM "ADM".Modulos AS t1
	
  WHERE  T1.Est_Act IS TRUE
  
  ORDER BY Iden,  Orden;

-- Comentarios de vista y los campos: 
  
COMMENT ON  VIEW  "ADM".VW_Qry_Modulo			IS 'Vista de los Modulos permitidos al perfil del usuario';
COMMENT ON COLUMN "ADM".VW_Qry_Modulo.Iden		IS 'Clave del modulo' ;
COMMENT ON COLUMN "ADM".VW_Qry_Modulo.Modulo 	IS 'Nombre del modulo';
COMMENT ON COLUMN "ADM".VW_Qry_Modulo.Orden 	IS 'Orden del modulo';
COMMENT ON COLUMN "ADM".VW_Qry_Modulo.Raiz 		IS 'Raiz del modulo';

ALTER VIEW "ADM".VW_Qry_Modulo OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE PERFILES ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Perfil CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Perfil AS

SELECT 
		T1.Per_Cve 						AS Per_Cve			, 
		UPPER(TRIM(Per_Nom)::text)  	AS Perfil			, 
		UPPER(TRIM(Per_Des)::text)  	AS Descripcion		, 
		Per_Res  						AS Restricciones	, 
		UPPER(TRIM(Per_Com)::text)  	AS Comentario

FROM 	"ADM".Perfiles AS T1

WHERE	T1.Est_Act IS true 

ORDER BY Per_Cve;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Perfil				IS 'Vista de los Perfiles';
COMMENT ON COLUMN "ADM".VW_Qry_Perfil.Per_Cve		IS 'Clave de los Perfiles' ;
COMMENT ON COLUMN "ADM".VW_Qry_Perfil.Perfil 		IS 'Perfil';
COMMENT ON COLUMN "ADM".VW_Qry_Perfil.Descripcion 	IS 'Descripcion de los Perfiles';
COMMENT ON COLUMN "ADM".VW_Qry_Perfil.Restricciones	IS 'Restricciones de los Perfiles';
COMMENT ON COLUMN "ADM".VW_Qry_Perfil.Comentario 	IS 'COmentarios de los Perfiles';

ALTER VIEW "ADM".VW_Qry_Perfil OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE PUESTOS ----------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Puesto CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Puesto AS

SELECT
		T1.Pue_Cve  					AS Pos_Cve		, 
		UPPER(TRIM(T1.Pue_Des)::text)  	AS Puesto		, 
		T1.Pue_Prior  					AS Prioridad

FROM 	"ADM".Puestos AS T1

WHERE	T1.Est_Act IS true 

ORDER BY Pos_Cve;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Puesto				IS 'Vista de los Puestos';
COMMENT ON COLUMN "ADM".VW_Qry_Puesto.Pos_Cve		IS 'Clave de los Puestos' ;
COMMENT ON COLUMN "ADM".VW_Qry_Puesto.Puesto 		IS 'Nombre de los Puestos';
COMMENT ON COLUMN "ADM".VW_Qry_Puesto.Prioridad 	IS 'Prioridad del puesto';

ALTER VIEW "ADM".VW_Qry_Puesto OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE USUARIOS ---------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Usuario CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Usuario AS

 SELECT 
		T1.Usu_Id 							AS Usu_Id,

		T1.Usu_Usr  						AS Usuario,
		T1.Usu_Pas 					 		AS Password,

		T1.Edo_Id 					 		AS Estado,
		T1.Reg_Cat_Id 				 		AS Region,
		T1.Mun_Id 							AS Municipio,
		T1.Loc_Id 					 		AS Localidad,

		T1.Usu_Tpo_Usr				 		AS Tipo_Usuario,
		UPPER(TRIM((T1.Usu_Pat)::text))  	AS Paterno,
		UPPER(TRIM((T1.Usu_Mat)::text))  	AS Materno,
		UPPER(TRIM((T1.Usu_Nom)::text)) 	AS Nombre,

		UPPER(TRIM((T1.Usu_Tel)::text))  	AS Tel,
		UPPER(TRIM((T1.Usu_Ext)::text))  	AS Ext,
		T1.Usu_Mac					 		AS Mac,
		T1.Usu_Email 				 		AS Mail,
		T1.Usu_Smtp_host 			 		AS Host,
		T1.Usu_Smtp_Pto 					AS SMTP,
		UPPER(TRIM((T1.Usu_Ubi)::text))  	AS Ubicacion,
		UPPER(TRIM((T1.Usu_Obs)::text))  	AS Observaciones,
		UPPER(TRIM((T1.Usu_Adm)::text)) 	AS administrador,

		T1.Usu_Fot 				 			AS Foto,
		T1.Usu_Arc 				 			AS Archivo,
		T1.Usu_Xet 				 			AS Extension
	
   FROM "ADM".Usuarios AS T1
	
  WHERE T1.Est_Act IS TRUE
  
  ORDER BY Usu_Id;

-- Comentarios de vista y los campos: 
  
COMMENT ON  VIEW  "ADM".VW_Qry_Usuario			IS 'Vista de los usuarios';
COMMENT ON COLUMN "ADM".VW_Qry_Usuario.Usu_Id	IS 'Clave los usuarios' ;


ALTER VIEW "ADM".VW_Qry_Usuario OWNER TO "ADM";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE PERFILES Y MODULOS -----------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Perfil_Modulo CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Perfil_Modulo AS

SELECT 
		T1.Per_Cve 						AS Per_Cve			, 
		UPPER(TRIM(Per_Nom)::text)  	AS Perfil			, 
		UPPER(TRIM(Per_Des)::text)  	AS Descripcion		, 
		Per_Res  						AS Restricciones	, 
		UPPER(TRIM(Per_Com)::text)  	AS Comentario 		, 

 		T2.Mod_Cve						AS Iden,
		UPPER(TRIM((T2.Mod_nom)::text)) AS Modulo,
		T2.Mod_ord 						AS Orden,
		T2.Mod_Cve_raiz 					AS Raiz
		
FROM 	"ADM".Perfiles AS T1, "ADM".Modulos AS T2, "ADM".Res_Perfiles_Modulos AS T3

WHERE	T1.Per_Cve = T3.Per_Cve AND T2.Mod_Cve = T3.Mod_Cve AND T1.Est_Act IS true AND T2.Est_Act is true AND T3.Per_Mod_Est is true

ORDER BY T1.Per_Cve, T2.Mod_Cve;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Perfil_Modulo	IS 'Vista de los departamentos de cada Dependencias del Ayuntamiento';


ALTER VIEW "ADM".VW_Qry_Perfil_Modulo OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE PERFILES Y USUARIOS ----------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- DROP 		VIEW if exists 	"ADM".VW_Qry_Perfil_Usuario CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Perfil_Usuario AS

SELECT 
		T1.Per_Cve 							AS Per_Cve			, 
		UPPER(TRIM(Per_Nom)::text)  		AS Perfil			, 
		UPPER(TRIM(Per_Des)::text)  		AS Descripcion		, 
		Per_Res  							AS Restricciones	, 
		UPPER(TRIM(Per_Com)::text)  		AS Comentario , 

		T2.Usu_Id 							AS Usu_Id,

		T2.Usu_Usr  						AS Usuario,
		T2.Usu_Pas 					 		AS Password,

		T2.Edo_Id 					 		AS Estado,
		T2.Reg_Cat_Id 				 		AS Region,
		T2.Mun_Id 							AS Municipio,
		T2.Loc_Id 					 		AS Localidad,

		T2.Usu_Tpo_Usr				 		AS Tipo_Usuario,
		UPPER(TRIM((T2.Usu_Pat)::text))  	AS Paterno,
		UPPER(TRIM((T2.Usu_Mat)::text))  	AS materno,
		UPPER(TRIM((T2.Usu_Nom)::text)) 	AS Nombre,

		UPPER(TRIM((T2.Usu_Tel)::text))  	AS Tel,
		UPPER(TRIM((T2.Usu_Ext)::text))  	AS Ext,
		T2.Usu_Mac					 		AS Mac,
		T2.Usu_Email 				 		AS Mail,
		T2.Usu_Smtp_host 			 		AS Host,
		T2.Usu_Smtp_Pto 					AS SMTP,
		UPPER(TRIM((T2.Usu_Ubi)::text))  	AS Ubicacion,
		UPPER(TRIM((T2.Usu_Obs)::text))  	AS Observaciones,
		UPPER(TRIM((T2.Usu_Adm)::text)) 	AS administrador,

		T2.Usu_Fot 				 			AS Foto,
		T2.Usu_Arc 				 			AS Archivo,
		T2.Usu_Xet 				 			AS Extension
		
FROM 	"ADM".Perfiles AS T1, "ADM".Usuarios AS T2, "ADM".Res_Perfiles_Usuarios AS T3

WHERE	T1.Per_Cve = T3.Per_Cve AND T2.Usu_Id = T3.Usu_Id AND T1.Est_Act IS true AND T2.Est_Act is true AND T3.Per_Usr_Est_Act is true

ORDER BY T1.Per_Cve, T2.Usu_Id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Perfil_Usuario			IS 'Vista de los departamentos de cada Dependencias del Ayuntamiento';


ALTER VIEW "ADM".VW_Qry_Perfil_Usuario OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE PERFILES Y AREAS -------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"ADM".VW_Qry_Perfil_Area CASCADE;

CREATE		VIEW 			"ADM".VW_Qry_Perfil_Area AS

SELECT 
		T3.Per_Dpa_Con 				AS Per_Are_Cve			, 
		T3.Per_Cve  				AS Perfil_Cve			, 
		T1.Per_Nom 					AS Perfil				,
		T3.Dpa_Cve   				AS Area_Cve				, 
		T2.Dpa_Nom 					AS Area 				, 

		T3.Per_Dep_Est 				AS Estatus

FROM 	"ADM".Perfiles AS T1, "ADM".Departamentos AS T2, "ADM".Res_Perfiles_Areas AS T3

WHERE	T1.Per_Cve = T3.Per_Cve AND T2.Dpa_Cve = T3.Dpa_Cve AND T3.Per_Dep_Est is true AND T1.Est_Act IS true AND T2.Est_Act is true 

ORDER BY T3.Per_Cve, T3.Dpa_Cve;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "ADM".VW_Qry_Perfil_Area		IS 'Vista de los Perfiles por area';


ALTER VIEW "ADM".VW_Qry_Perfil_Area OWNER TO "ADM";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------



-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- TABLAS EN EL ESQUEMA DE ADMINISTRACION "ADM"
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL
-- NOTAS: 

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CONTENIDO -----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION TABLAS DEL ESQUEMA DE ADMINISTRACION "ADM" ------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- FUNCION DE DEPENDENCIAS MUNICIPALES O ESTATALES 
-- FUNCION DE DEPARTAMENTOS O AREAS
-- FUNCION DE JORNADA LABORAL
-- FUNCION DE MODULOS DEL GEOESCRITORIO VIRTUAL
-- FUNCION DE PERFILES O GRUPOS DE USUARIOS
-- FUNCION DE PUESTOS
-- FUNCION DE USUARIOS

-- TABLA RESOLUTIVA DE PERFILES CON MODULOS
-- TABLA RESOLUTIVA DE USUARIOS CON PERFIL, DEPARTAMENTO Y PUESTO

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION TABLAS DE AUDITORIA DE CATALOGOS DE LA BASE DE DATOS "GEV_DEV" ----------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- CATALOGO DE CATALOGOS DEL ESQUEMA ADM 
-- CATALOGO DE LOS DETALLES DE LOS CATALOGOS DEL ESQUEMA ADM 
-- BITACORA DE AUDITORIA DEL ESQUEMA ADM




-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE DEPENDENCIAS MUNICIPALES O ESTATALES --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Dependencia(smallint)
  RETURNS SETOF "ADM".tpo_dependencia AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_dependencia%ROWTYPE;

	BEGIN

	  SELECT 	Dep_Id, Dep_Nom, Dep_Abr
		INTO 	_v_type
		FROM 	"ADM".VW_Qry_Dependencia AS T1
		WHERE 	cve = T1.Dep_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Dependencia % no encontrada',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "ADM".FN_Get_Dependencia(smallint) IS 'Funcion que devuelve los datos de las dependencias';

ALTER 		FUNCTION "ADM".FN_Get_Dependencia(smallint) OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE DEPARTAMENTOS O AREAS -----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Departamento(smallint)
  RETURNS SETOF "ADM".tpo_departamento AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_departamento%ROWTYPE;

	BEGIN

		SELECT 	Dep_Id, Dpa_Id, Departamento, Abr_Departamento   
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Departamento AS T1
		WHERE 	cve = T1.Dpa_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Departamento % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Departamento(smallint) IS 'Funcion que devuelve los datos de los departamentos de cada dependencia';

ALTER 		FUNCTION "ADM".FN_Get_Departamento(smallint) OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LAS JORNADAS ------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Jornada(smallint)
  RETURNS SETOF "ADM".tpo_jornada AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_jornada%ROWTYPE;

	BEGIN

		SELECT 	Jor_Id, Jornada, Dias, Hora_Inicial, Hora_Final   
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Jornada AS T1
		WHERE 	cve = T1.Jor_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Jornadas % no encontradas',  cve
			USING HINT = 'Revise la clave  introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Jornada(smallint) IS 'Funcion que devuelve los datos de las jornadas de las dependencia';

ALTER 		FUNCTION "ADM".FN_Get_Jornada(smallint) OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS MODULOS--------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Modulo(smallint)
  RETURNS SETOF "ADM".tpo_modulo AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_modulo%ROWTYPE;

	BEGIN

		SELECT 	Iden, Modulo, Orden, Raiz   
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Modulo AS T1
		WHERE 	cve = T1.Iden
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Modulo % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Modulo(smallint) IS 'Funcion que devuelve los datos de las Modulos del sistema';

ALTER 		FUNCTION "ADM".FN_Get_Modulo(smallint) OWNER TO "ADM";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS PERFILES,-----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Perfil(smallint)
  RETURNS SETOF "ADM".tpo_perfil AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_perfil%ROWTYPE;

	BEGIN

		SELECT 	Per_id, Perfil, Descripcion, Restricciones, Comentario   
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Perfil AS T1
		WHERE 	cve = T1.Per_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Perfil % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Perfil(smallint) IS 'Funcion que devuelve los datos de las perfiles de los usuarios';

ALTER 		FUNCTION "ADM".FN_Get_Perfil(smallint) OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS PUESTOS  -----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Puesto(smallint)
  RETURNS SETOF "ADM".tpo_puesto AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_puesto%ROWTYPE;

	BEGIN

		SELECT 	Pos_Id, Puesto, Prioridad
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Puesto AS T1
		WHERE 	cve = T1.Pos_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Puesto % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Puesto(smallint) IS 'Funcion que devuelve los datos de las puestos de los usuarios';

ALTER 		FUNCTION "ADM".FN_Get_Puesto(smallint) OWNER TO "ADM";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS USUARIOS -----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Usuario(smallint)
  RETURNS SETOF "ADM".tpo_usuario AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_usuario%ROWTYPE;

	BEGIN

		SELECT 	Usu_Id, Usuario, Password, Estado, Region, Municipio, Localidad, Tipo_Usuario, Paterno, Materno, Nombre, Tel, Ext, Mac, Mail, Host, SMTP, Ubicacion, Observaciones, administrador, Foto, Archivo, Extension     
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Usuario AS T1
		WHERE 	cve = T1.Usu_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Usuario % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Usuario(smallint) IS 'Funcion que devuelve los datos de los usuarios';

ALTER 		FUNCTION "ADM".FN_Get_Usuario(smallint) OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS PERFILES Y MODULOS -----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Perfil_Modulo(smallint)
  RETURNS SETOF "ADM".tpo_perfil_modulo AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_perfil_modulo%ROWTYPE;

	BEGIN

		SELECT 	Per_id, Perfil, Descripcion, Restricciones, Comentario, Iden, Modulo, Orden, Raiz  
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Perfil_Modulo AS T1
		WHERE 	cve = T1.Per_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Perfil-Modulo % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Perfil_Modulo(smallint) IS 'Funcion que devuelve los datos de los perfiles y modulos permitidos';

ALTER 		FUNCTION "ADM".FN_Get_Perfil_Modulo(smallint) OWNER TO "ADM";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS PERFILES Y USUARIOS -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Perfil_Usuario(smallint)
  RETURNS SETOF "ADM".tpo_perfil_usuario AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_perfil_usuario%ROWTYPE;

	BEGIN

		SELECT 	Per_id, Perfil, Descripcion, Restricciones, Comentario, Usu_Id, Usuario, Password, Estado, Region, Municipio, Localidad, Paterno, Materno, Nombre, Tel, Ext, Mac, Mail, Host, SMTP, Ubicacion, Observaciones, Administrador, Foto, Archivo, Extension
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Perfil_usuario AS T1
		WHERE 	cve = T1.Per_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Perfil-Usuario % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Perfil_Usuario(smallint) IS 'Funcion que devuelve los datos de los perfiles y usuarios';

ALTER 		FUNCTION "ADM".FN_Get_Perfil_Usuario(smallint) OWNER TO "ADM";



-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION QUE OBTIENE LOS PERFILES Y AREAS -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "ADM".FN_Get_Perfil_Area(smallint)
  RETURNS SETOF "ADM".tpo_perfil_area AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".tpo_perfil_area%ROWTYPE;

	BEGIN

		SELECT 	Per_Are_id, Perfil_id, Perfil, Area_id,  Area, Estatus
		INTO 	_v_type
		FROM  	"ADM".VW_Qry_Perfil_Area AS T1
		WHERE 	cve = T1.Per_Are_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Perfil-Area % no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100
ROWS 1000;
  
COMMENT ON 	FUNCTION "ADM".FN_Get_Perfil_Area(smallint) IS 'Funcion que devuelve los datos de los perfiles y usuarios';

ALTER 		FUNCTION "ADM".FN_Get_Perfil_Area(smallint) OWNER TO "ADM";







-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION PERMISOS DE USO ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- PERMISOS PARA PROPIETARIO "ADM" EN SECUENCIAS Y TABLAS (SIN DELETE) -------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


GRANT ALL ON SEQUENCE "ADM".departamentos_dpa_Cve_seq 				TO "ADM";
GRANT ALL ON SEQUENCE "ADM".dependencias_dep_Cve_seq 				TO "ADM";
GRANT ALL ON SEQUENCE "ADM".jornadas_jor_Cve_seq 					TO "ADM";
GRANT ALL ON SEQUENCE "ADM".modulos_mod_Cve_seq 					TO "ADM";
GRANT ALL ON SEQUENCE "ADM".perfiles_per_Cve_seq 					TO "ADM";
GRANT ALL ON SEQUENCE "ADM".puestos_pue_Cve_seq				 		TO "ADM";
GRANT ALL ON SEQUENCE "ADM".res_perfiles_areas_per_dpa_con_seq 		TO "ADM";
GRANT ALL ON SEQUENCE "ADM".res_perfiles_modulos_per_mod_con_seq 	TO "ADM";
GRANT ALL ON SEQUENCE "ADM".res_perfiles_usuarios_per_usr_con_seq 	TO "ADM";
GRANT ALL ON SEQUENCE "ADM".usuarios_usu_id_seq 					TO "ADM";


GRANT EXECUTE ON FUNCTION "ADM".fn_get_departamento(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_dependencia(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_jornada(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_modulo(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_area(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_modulo(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_usuario(smallint) 	TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_puesto(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_usuario(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_departamento(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_dependencia(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_jornada(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_modulo(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_area(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_modulo(smallint) 		TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_usuario(smallint) 	TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_puesto(smallint) 			TO "ADM";
GRANT EXECUTE ON FUNCTION "ADM".fn_get_usuario(smallint) 			TO "ADM";



GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".departamentos TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".dependencias TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".jornadas TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".modulos TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".perfiles TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".puestos TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".res_perfiles_areas TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".res_perfiles_modulos TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".res_perfiles_usuarios TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".usuarios TO "ADM";

GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_usr_sesion TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_departamento TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_dependencia TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_jornada TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_modulo TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_perfil TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_perfil_area TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_perfil_modulo TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_perfil_usuario TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_puesto TO "ADM";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "ADM".vw_qry_usuario TO "ADM";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- PERMISOS PARA USUARIO "FTG", "IDE", "KTT", "TSR", "SBI", "UNI", "URB" EN SECUENCIAS Y  EN TABLAS --------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


GRANT SELECT ON SEQUENCE "ADM".departamentos_dpa_Cve_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".dependencias_dep_Cve_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".jornadas_jor_Cve_seq 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".modulos_mod_Cve_seq 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".perfiles_per_Cve_seq 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".puestos_pue_Cve_seq 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".res_perfiles_areas_per_dpa_con_seq 		TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".res_perfiles_modulos_per_mod_con_seq 	TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".res_perfiles_usuarios_per_usr_con_seq 	TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "ADM".usuarios_usu_Cve_seq 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;


GRANT EXECUTE ON FUNCTION "ADM".fn_get_departamento(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_dependencia(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_jornada(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_modulo(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_area(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_modulo(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_usuario(smallint) 		TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_puesto(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_usuario(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_departamento(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_dependencia(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_jornada(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_modulo(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_area(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_modulo(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_perfil_usuario(smallint) 		TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_puesto(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "ADM".fn_get_usuario(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;


GRANT SELECT ON TABLE "ADM".departamentos 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".dependencias 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".jornadas 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".modulos 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".perfiles 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".puestos 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".res_perfiles_areas 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".res_perfiles_modulos 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".res_perfiles_usuarios 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".usuarios 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;


GRANT SELECT ON TABLE "ADM".vw_qry_usr_sesion 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_departamento 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_dependencia 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_jornada 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_modulo 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_perfil 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_perfil_area 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_perfil_modulo 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_perfil_usuario 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_puesto 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "ADM".vw_qry_usuario 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;


-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------