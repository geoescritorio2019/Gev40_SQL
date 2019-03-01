
-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- TABLAS EN EL ESQUEMA "UNI_KAT"
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CONTENIDO -----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION FLUJO DE TRABAJO --------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- CATALOGO DE TIPOS DE ELEMENTOS DEL MODELO DE PROCESO DE NEGOCIOS
-- CATALOGO DE LOS TIPOS DE SERVICIO DE LOS TRAMITES O SERVICIOS
-- CATALOGO DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA
-- CATALOGO DE INSUMOS DETALLADOS
-- CATALOGO DE RESULTADOS O PRODUCTOS GENERAL
-- CATALOGO DE RESULTADOS O PRODUCTOS DETALLADO
-- CATALOGO DE REQUERIMIENTOS GENERAL
-- CATALOGO DE REQUERIMIENTOS DETALLADOS
-- CATALOGO DE PROCESOS GENERALES O TRAMITES Y SERVICIOS
-- CATALOGO DE VARIANTES O MATICES DE LOS TRAMITES O SERVICIOS
-- CATALOGO DE LOS TRAMITES O SERVICIOS DETALLADOS POR TAREAS
-- CATALOGO DE PROCESOS INVOCADOS CON PARAMETROS DE PADRON DE PREDIOS, PADRON DE PERSONAS Y PROCESO

-- TABLA RESOLUTIVA DE TAREAS CON INSUMOS
-- TABLA RESOLUTIVA DE TAREAS CON RESULTADOS O PRODUCTOS
-- TABLA RESOLUTIVA DE TAREAS CON REQUERIMIENTOS ESPECIFICOS

-- SECCION DE VISTAS

-- VISTA DE PROCESOS TRAMITES Y SERVICIOS
 


 
 



-- ---------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
-- SECCION DE CATALOGOS PARA EL FLUJO DE TRABAJO EN LA VENTANILLA UNICA 
-- ---------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE TIPOS DE ELEMENTOS DEL MODELO DE PROCESO DE NEGOCIOS ----------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Tipos_Elementos CASCADE;

CREATE 	TABLE 				"UNI_KAT".Tipos_Elementos
(
	Tpo_Ele_Cve 			SMALLSERIAL  							,

	Tpo_Ele_Des 			"public".DOM_DES						,
	Tpo_Ele_Des_Grafico 	BYTEA	 	NOT NULL 					,

	Usr_Cve					VARCHAR(25) NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Tpo_Ele_Cve_PK 	PRIMARY KEY (Tpo_Ele_Cve) ,
	CONSTRAINT 				Tpo_Ele_Des_UNQ UNIQUE 		(Tpo_Ele_Des)
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 
  
COMMENT ON TABLE  "UNI_KAT".Tipos_Elementos 						IS 'Catalogo de los elementos BPM que intervienen en cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Elementos.Tpo_Ele_Cve 			IS 'Clave del Tipo del elemento' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Elementos.Tpo_Ele_Des 			IS 'Descripcion unica del elemento' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Elementos.Tpo_Ele_Des_Grafico 	IS 'Descripcion grafica del elemento' ;

COMMENT ON COLUMN "UNI_KAT".Tipos_Elementos.Usr_Cve 				IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Elementos.Est_Act 				IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Elementos.Fec_Mod 				IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Tpo_Ele_Cve_PK 								ON "UNI_KAT".Tipos_Elementos IS 'Llave Primaria de la tabla Tipos_Elementos';
COMMENT ON CONSTRAINT Tpo_Ele_Des_UNQ 								ON "UNI_KAT".Tipos_Elementos IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Tipos_Elementos OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA TIPOS DE ELEMENTOS DEL MODELO DE PROCESO DE NEGOCIOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists 		"UNI_KAT".Tpo_Tpo_Elemento CASCADE;

CREATE 	TYPE 				"UNI_KAT".Tpo_Tpo_Elemento AS 
(
	Tpo_Ele_Cve 			VARCHAR(254) 		,
	Tpo_Ele_Des				VARCHAR(254)		,

	Tpo_Ele_Des_Grafico 	VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Tpo_Elemento IS  'Tipo de Tipos de Elementos' ;

ALTER TYPE "UNI_KAT".Tpo_Tpo_Elemento OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE VISTAS DE LAS APLICACIONES ------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Vistas CASCADE;

CREATE 	TABLE 					"UNI_KAT".Vistas
(
	Vta_Con 					SMALLSERIAL  						,

	Vta_Cve 					SMALLINT NOT NULL					,
	Vta_Des 					"public".DOM_DES					,

	Usr_Cve						VARCHAR(25) NOT NULL DEFAULT 'UNI'	,
	Est_Act 					BOOLEAN 	NOT NULL DEFAULT true  	, 
	Fec_Mod 					"public".DOM_FEC 					,

	CONSTRAINT 					Vta_Cve_PK 	PRIMARY KEY (Vta_Cve) 	,
	CONSTRAINT 					Vta_Des_UNQ UNIQUE 		(Vta_Des)
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 
  
COMMENT ON TABLE  "UNI_KAT".Vistas 						IS 'Catalogo de las Vistas que componen cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Vistas.Vta_Con 				IS 'Consecutivo de las Vistas ' ;

COMMENT ON COLUMN "UNI_KAT".Vistas.Vta_Cve 				IS 'Clave unica de las Vistas' ;
COMMENT ON COLUMN "UNI_KAT".Vistas.Vta_Des 				IS 'Descripcion de las Vistas' ;

COMMENT ON COLUMN "UNI_KAT".Vistas.Usr_Cve 				IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Vistas.Est_Act 				IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Vistas.Fec_Mod 				IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Vta_Cve_PK 						ON "UNI_KAT".Vistas IS 'Llave Primaria de la tabla Vistas';
COMMENT ON CONSTRAINT Vta_Des_UNQ 						ON "UNI_KAT".Vistas IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Vistas OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA TIPOS DE ELEMENTOS DEL MODELO DE PROCESO DE NEGOCIOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists 		"UNI_KAT".Tpo_Vista_Seccion CASCADE;

CREATE 	TYPE 				"UNI_KAT".Tpo_Vista_Seccion AS 
(
	Vta_Con 				VARCHAR(254) 		,

	Vta_Cve					VARCHAR(254)		,
	Vta_Sec 				VARCHAR(254) 		,
	Vta_Des					VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Vista_Seccion IS  'Tipo de Vistas y Secciones' ;

ALTER 		TYPE "UNI_KAT".Tpo_Vista_Seccion OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE Secciones DE LAS VISTAS DE LAS APLICACIONES ------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Secciones CASCADE;

CREATE 	TABLE 				"UNI_KAT".Secciones
(
	Sec_Con 				SMALLSERIAL  							,

	Sec_Cve 				SMALLINT NOT NULL						,
	Sec_Des 				"public".DOM_DES						,

	Usr_Cve					VARCHAR(25) NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Sec_Cve_PK 	PRIMARY KEY (Sec_Cve) 		,
	CONSTRAINT 				Sec_Des_UNQ UNIQUE 		(Sec_Des)
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 
  
COMMENT ON TABLE  "UNI_KAT".Secciones 						IS 'Catalogo de las secciones que componen cada Vista de los procesos' ;
COMMENT ON COLUMN "UNI_KAT".Secciones.Sec_Con 				IS 'Consecutivo  de las secciones' ;

COMMENT ON COLUMN "UNI_KAT".Secciones.Sec_Cve 				IS 'Clave de las secciones' ;
COMMENT ON COLUMN "UNI_KAT".Secciones.Sec_Des 				IS 'Descripcion  de las secciones' ;

COMMENT ON COLUMN "UNI_KAT".Secciones.Usr_Cve 				IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Secciones.Est_Act 				IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Secciones.Fec_Mod 				IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Sec_Cve_PK 							ON "UNI_KAT".Secciones IS 'Llave Primaria de la tabla Secciones';
COMMENT ON CONSTRAINT Sec_Des_UNQ 							ON "UNI_KAT".Secciones IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Secciones OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA TIPOS DE ELEMENTOS DEL MODELO DE PROCESO DE NEGOCIOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists 		"UNI_KAT".Tpo_Seccion CASCADE;

CREATE 	TYPE 				"UNI_KAT".Tpo_Seccion AS 
(
	Sec_Con 				VARCHAR(254) 		,

	Sec_Cve					VARCHAR(254)		,
	Sec_Des 				VARCHAR(254)
);

COMMENT ON 	TYPE "UNI_KAT".Tpo_Seccion IS  'Tipo de Vistas y Secciones' ;

ALTER 		TYPE "UNI_KAT".Tpo_Seccion OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- TABLA RESOLUTIVA DE VISTAS CON SECCIONES DE LAS APLICACIONES --------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Res_Vistas_Secciones CASCADE;

CREATE 	TABLE 				"UNI_KAT".Res_Vistas_Secciones 
(
	Vta_Sec_Con 			SMALLSERIAL  								,

	Vta_Cve 				SMALLINT NOT NULL							,
	Sec_Cve 				SMALLINT NOT NULL							,
	Vta_Sec_URL 			VARCHAR(254) NOT NULL 						,

	Usr_Cve					VARCHAR(25) NOT NULL DEFAULT 'UNI'			,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  			, 
	Fec_Mod 				"public".DOM_FEC 							,

	CONSTRAINT 				Vta_Sec_Con_PK 	PRIMARY KEY (Vta_Sec_Con )	,
	CONSTRAINT 				Vta_Cve_FK 		FOREIGN KEY (Vta_Cve ) 	REFERENCES "UNI_KAT".Vistas 		(Vta_Cve) 	ON DELETE NO ACTION NOT DEFERRABLE ,
	CONSTRAINT 				Sec_Cve_FK 		FOREIGN KEY (Sec_Cve ) 	REFERENCES "UNI_KAT".Secciones 		(Sec_Cve)  	ON DELETE NO ACTION NOT DEFERRABLE
)
WITH (OIDS=FALSE);

-- Indices de la tabla:

DROP 	INDEX if exists Vta_Sec_Con_IDX CASCADE;

CREATE 	INDEX 			Vta_Sec_Con_IDX ON "UNI_KAT".Res_Vistas_Secciones USING BTREE (Vta_Cve,  Sec_Cve);

COMMENT ON INDEX "UNI_KAT".Vta_Sec_Con_IDX 							IS 'Indice de la resolucion entre Vistas y Secciones';

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Res_Vistas_Secciones					IS 'Tabla Resolutiva de Vistas y sus Secciones con Areas';
COMMENT ON COLUMN "UNI_KAT".Res_Vistas_Secciones.Vta_Sec_Con 		IS 'Identificacion de las Vistas';
COMMENT ON COLUMN "UNI_KAT".Res_Vistas_Secciones.Vta_Cve 			IS 'Identificacion de las Vistas';
COMMENT ON COLUMN "UNI_KAT".Res_Vistas_Secciones.Sec_Cve 			IS 'Identificacion de las Secciones de cada Vista';
COMMENT ON COLUMN "UNI_KAT".Res_Vistas_Secciones.Vta_Sec_URL 		IS 'URL de la Vista Seccion';

COMMENT ON CONSTRAINT Vta_Sec_Con_PK 								ON "UNI_KAT".Res_Vistas_Secciones IS 'Llave Primaria de la tabla Res_Vistas_Secciones';
COMMENT ON CONSTRAINT Vta_Cve_FK 									ON "UNI_KAT".Res_Vistas_Secciones IS 'Llave Foranea que apunta desde la tabla Perfiles';
COMMENT ON CONSTRAINT Sec_Cve_FK 									ON "UNI_KAT".Res_Vistas_Secciones IS 'Llave Foranea que apunta desde la tabla Departamentos';

ALTER TABLE "UNI_KAT".Res_Vistas_Secciones OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE DE VISTAS CON SECCIONES DE LAS APLICACIONES
-- ---------------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Res_Vista_Seccion CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Res_Vista_Seccion AS 
(
	Per_Dpa_Con 			VARCHAR(254) 		,
	Per_Id 					VARCHAR(254) 		,
	Per_Des 				VARCHAR(254) 		,
	Dpa_Id 					VARCHAR(254) 		,
	Dpa_Nom 				VARCHAR(254) 		,
	Per_Dep_Est				VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Res_Vista_Seccion IS  'Tipo de dato de la tabla Perfiles' ;

ALTER TYPE "UNI_KAT".Tpo_Res_Vista_Seccion OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE LOS TIPOS DE SERVICIO DE LOS Tramites O SERVICIOS -------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Tipos_Tramites CASCADE;

CREATE 	TABLE 				"UNI_KAT".Tipos_Tramites
(
	Tpo_Tra_Cve 			SMALLSERIAL  							,

	Tpo_Ser_Des 			"public".DOM_DES						,

	Usr_Cve					VARCHAR(25)	NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Tpo_Tra_Cve_PK 	PRIMARY KEY (Tpo_Tra_Cve) ,
	CONSTRAINT 				Tpo_Ser_Des_UNQ UNIQUE 		(Tpo_Ser_Des)
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 
  
COMMENT ON TABLE  "UNI_KAT".Tipos_Tramites 				IS 'Catalogo de los tipos de servicio de los procesos' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Tramites.Tpo_Tra_Cve 	IS 'Clave del Tipo de Servicio' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Tramites.Tpo_Ser_Des 	IS 'Descripcion unica del Servicio' ;

COMMENT ON COLUMN "UNI_KAT".Tipos_Tramites.Usr_Cve 		IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Tramites.Est_Act 		IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Tipos_Tramites.Fec_Mod 		IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Tpo_Tra_Cve_PK 					ON "UNI_KAT".Tipos_Tramites IS 'Llave Primaria de la tabla Tipos_Tramites';
COMMENT ON CONSTRAINT Tpo_Ser_Des_UNQ 					ON "UNI_KAT".Tipos_Tramites IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Tipos_Tramites OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA TIPOS DE SERVICIO DE LOS Tramites O SERVICIOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Tpo_Tramite CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Tpo_Tramite AS 
(
	Tpo_Tra_Cve 				VARCHAR(254) 		,
	Tpo_Ser_Des					VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Tpo_Tramite IS  'Tipo de Tipos de Tramites' ;

ALTER TYPE "UNI_KAT".Tpo_Tpo_Tramite OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA --------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Insumos_Generales CASCADE;

CREATE 	TABLE 				"UNI_KAT".Insumos_Generales
(
	Ins_Gen_Cve 			SMALLSERIAL 								,
	
	Ins_Gen_Des 			"public".DOM_DES							,
	Ins_Gen_Tpo 			VARCHAR(254)	NOT NULL  DEFAULT 'D' 		,
	Ins_Gen_Dir 			VARCHAR(254)  	NOT NULL					,

	
	Usr_Cve					VARCHAR(25)  	NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 		NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 							,

	CONSTRAINT 				Ins_Gen_Cve_PK 	PRIMARY KEY (Ins_Gen_Cve)  ,
	CONSTRAINT 				Ins_Gen_Des_UNQ	UNIQUE 	(Ins_Gen_Des)
) 
  WITH (OIDS=FALSE);
  
-- Comentarios de tabla y los campos: 

COMMENT  ON TABLE "UNI_KAT".Insumos_Generales 					IS 'Catalogo de las familias de insumos y documentos requeridos en cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Ins_Gen_Cve 		IS 'Clave consecutiva de la familia de documentos' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Ins_Gen_Des 		IS 'Descripcion de los documentos' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Ins_Gen_Tpo 		IS 'Tipo del elemento: (D)ocumental; (E)lectronico; (A)mbos' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Ins_Gen_Dir 		IS 'Referencia a la ruta General del directorio repositorio para guardar documentos: F:\BOVEDA_FTG_IN\xxx\ ' ;

COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Usr_Cve 			IS 'Ultimo usuario que administro el Catalogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Est_Act 			IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales.Fec_Mod 			IS 'Fecha de la ultima operacion de actualizacion del Catalogo';

COMMENT ON CONSTRAINT Ins_Gen_Cve_PK 							ON "UNI_KAT".Insumos_Generales IS 'Llave Primaria de la tabla Insumos_Generales';
COMMENT ON CONSTRAINT Ins_Gen_Des_UNQ 							ON "UNI_KAT".Insumos_Generales IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Insumos_Generales OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA 
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Insumo_General CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Insumo_General AS 
(
	Ins_Gen_Cve 				VARCHAR(254) 		,

	Ins_Gen_Des					VARCHAR(254)		,
	Ins_Gen_Tpo					VARCHAR(254)		,
	Ins_Gen_Dir					VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Insumo_General IS  'Tipo de Insumos Generales' ;

ALTER TYPE "UNI_KAT".Tpo_Insumo_General OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE INSUMOS DETALLADOS --------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists "UNI_KAT".Insumos_Generales_Detalle CASCADE;

CREATE TABLE 			"UNI_KAT".Insumos_Generales_Detalle
(
	Ins_Det_Con 			SMALLSERIAL 							,

	Ins_Gen_Cve 			SMALLINT  	NOT NULL 					,
	Ins_Det_Cve 			SMALLINT 	NOT NULL 					,

	Ins_Det_Des 			text , --"public".DOM_DES				,
	Ins_Det_Tpo 			VARCHAR(254) NOT NULL DEFAULT 'D' 		,    
	Ins_Det_No_Copias 		SMALLINT	 NOT NULL DEFAULT 1 		,
	Ins_Det_No_Original 	SMALLINT	 NOT NULL DEFAULT 1 		,
	Ins_Det_Dir 			VARCHAR(254) NOT NULL					,

	Usr_Cve					VARCHAR(25) NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Ins_Det_Cve_PK 	PRIMARY KEY (Ins_Gen_Cve, Ins_Det_Cve) ,
	CONSTRAINT 				Ins_Det_Des_UNQ UNIQUE 		(Ins_Det_Des) ,
	CONSTRAINT 				Ins_Gen_Cve_FK 	FOREIGN KEY (Ins_Gen_Cve) REFERENCES "UNI_KAT".Insumos_Generales (Ins_Gen_Cve)  ON DELETE NO ACTION ON UPDATE NO ACTION
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Insumos_Generales_Detalle 						IS 'Catalogo de los documentos requeridos o emitidos en cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_Con 			IS 'Consecutivo de los documentos requeridos o emitidos en cada proceso' ;

COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Gen_Cve			IS 'Clave foranea de familia de documentos' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_Cve 			IS 'Clave de los documentos requeridos o emitidos en cada proceso' ;

COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_Des 			IS 'Descripcion del insumo' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_Tpo 			IS 'Codigo del tipos de documentos' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_No_Copias 	IS 'No de copias a entregar en el tramite' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_No_Original 	IS 'Original(es) para cotejo o entrega' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Ins_Det_Dir 			IS 'Referencia a la ruta General del directorio repositorio para guardar documentos: F:\BOVEDA_FTG_IN\xxx\yyy\ ' ;

COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Usr_Cve 				IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Est_Act 				IS 'Estado del registro: Activo o Inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Insumos_Generales_Detalle.Fec_Mod 				IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Ins_Det_Cve_PK 										ON "UNI_KAT".Insumos_Generales_Detalle IS 'Llave Primaria de la tabla Insumos_Generales_Detalle';
COMMENT ON CONSTRAINT Ins_Det_Des_UNQ 										ON "UNI_KAT".Insumos_Generales_Detalle IS 'Valor unico del campo seleccionado, sin duplicados';
COMMENT ON CONSTRAINT Ins_Gen_Cve_FK 										ON "UNI_KAT".Insumos_Generales_Detalle IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Insumos_Generales';

ALTER TABLE "UNI_KAT".Insumos_Generales_Detalle OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE INSUMOS GENERAL INSUMOS DETALLADOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Insumo_General_Det CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Insumo_General_Det AS 
(
	Ins_Det_Con 				VARCHAR(254) 		,

	Ins_Gen_Cve 				VARCHAR(254) 		,
	Ins_Det_Cve 				VARCHAR(254) 		,

	Ins_Det_Des 				VARCHAR(254) 		,
	Ins_Det_Tpo					VARCHAR(254)		,
	Ins_Det_No_Copias			VARCHAR(254)		,
	Ins_Det_No_Original			VARCHAR(254) 		,
	Ins_Det_Dir 				VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Insumo_General_Det IS  'Tipo de Insumos Generales detallados' ;

ALTER TYPE "UNI_KAT".Tpo_Insumo_General_Det OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE RESULTADOS O PRODUCTOS GENERAL --------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists "UNI_KAT".Resultados_Generales CASCADE;

CREATE TABLE 			"UNI_KAT".Resultados_Generales
(
	Res_Gen_Cve 		SMALLSERIAL 							,

	Res_Gen_Des 		"public".DOM_DES						,
	Res_Gen_Tpo 		VARCHAR(254)   	DEFAULT 'I' NOT NULL 	,
	Res_Gen_Dir 		VARCHAR(254)  							,
	
	Usr_Cve				VARCHAR(25) NOT NULL DEFAULT 'UNI'		,
	Est_Act 			BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 			"public".DOM_FEC  						,

	CONSTRAINT 			Res_Gen_Cve_PK 		PRIMARY KEY (Res_Gen_Cve) ,
	CONSTRAINT 			Res_Gen_Des_UNQ 	UNIQUE 	 	(Res_Gen_Des)
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 
  
COMMENT ON TABLE  "UNI_KAT".Resultados_Generales 				IS 'Catalogo de las familias de insumos y documentos recibidos en cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Res_Gen_Cve 	IS 'Clave consecutiva de la familia de documentos' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Res_Gen_Des 	IS 'Descripcion de los documentos' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Res_Gen_Tpo	IS 'Tipo del elemento: (I) Insumo; (P) Producto; (A) Ambos' ;

COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Res_Gen_Dir 	IS 'Referencia a la ruta General del directorio repositorio para guardar documentos: F:\BOVEDA_FTG_OUT\ ' ;

COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Usr_Cve 		IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Est_Act 		IS 'Estado del registro: Activo o Inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales.Fec_Mod 		IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Res_Gen_Cve_PK 							ON "UNI_KAT".Resultados_Generales IS 'Llave Primaria de la tabla "UNI_KAT".Resultados_Generales';
COMMENT ON CONSTRAINT Res_Gen_Des_UNQ 							ON "UNI_KAT".Resultados_Generales IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Resultados_Generales OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE RESULTADOS O PRODUCTOS GENERAL
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Resultado_General CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Resultado_General AS 
(
	Res_Gen_Cve 				VARCHAR(254) 		,

	Res_Gen_Des					VARCHAR(254)		,
	Res_Gen_Tpo					VARCHAR(254)		,
	Res_Gen_Dir					VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Resultado_General IS  'Tipo de Resultados Generales' ;

ALTER TYPE "UNI_KAT".Tpo_Resultado_General OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE RESULTADOS O PRODUCTOS DETALLADO
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Resultados_Generales_Detalle CASCADE;

CREATE 	TABLE 				"UNI_KAT".Resultados_Generales_Detalle
(
	Res_Det_Con 			SMALLSERIAL 							,

	Res_Gen_Cve 			SMALLINT  NOT NULL 						,
	Res_Det_Cve 			SMALLINT  NOT NULL 						,

	Res_Det_Des 			"public".DOM_DES						,
	Res_Det_Tpo				VARCHAR(254)  							,
	Res_Det_Dir 			VARCHAR(254)  							,
	
	Usr_Cve					VARCHAR(25)  NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Res_Det_Cve_PK PRIMARY KEY (Res_Gen_Cve, Res_Det_Cve) ,
	CONSTRAINT 				Res_Det_Des_UNQ UNIQUE 		(Res_Det_Des) ,
	CONSTRAINT 				Res_Gen_Cve_FK FOREIGN KEY (Res_Gen_Cve) REFERENCES "UNI_KAT".Resultados_Generales (Res_Gen_Cve)  ON DELETE NO ACTION ON UPDATE NO ACTION
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Resultados_Generales_Detalle 				IS 'Catalogo de las familias de  de resultados o productos emitidos en cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Res_Det_Con 	IS 'Consecutivo de la familia de resultados o productos' ;

COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Res_Gen_Cve 	IS 'Clave consecutiva de la familia de  de resultados o productos' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Res_Det_Cve 	IS 'Descripcion de los  de resultados o productos' ;

COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Res_Det_Tpo 	IS 'Codigo del tipos de documentos' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Res_Det_Des 	IS 'Descripcion del resultado o producto' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Res_Det_Dir 	IS 'Referencia a la ruta del directorio repositorio para guardar  de resultados o productos: F:\BOVEDA_FTG_OUT\ ' ;

COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Usr_Cve 		IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Est_Act 		IS 'Estado del registro: Activo o Inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Resultados_Generales_Detalle.Fec_Mod 		IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Res_Det_Cve_PK 									ON "UNI_KAT".Resultados_Generales_Detalle IS 'Llave Primaria de la tabla "UNI_KAT".Resultados_Generales_Detalle';
COMMENT ON CONSTRAINT Res_Gen_Cve_FK 									ON "UNI_KAT".Resultados_Generales_Detalle IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Resultados_Generales';

ALTER TABLE "UNI_KAT".Resultados_Generales_Detalle OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE INSUMOS GENERAL INSUMOS DETALLADOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Resultado_General_Det CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Resultado_General_Det AS 
(
	Res_Det_Con 				VARCHAR(254) 		,

	Res_Gen_Cve 				VARCHAR(254) 		,
	Res_Det_Cve 				VARCHAR(254) 		,

	Res_Det_Des 				VARCHAR(254) 		,
	Res_Det_Tpo					VARCHAR(254)		,
	Res_Det_Dir 				VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Resultado_General_Det IS  'Tipo de Resultados Generales detallados' ;

ALTER TYPE "UNI_KAT".Tpo_Resultado_General_Det OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE PROCESOS GENERALES O TRAMITES Y SERVICIOS
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Tramites CASCADE;

CREATE TABLE 				"UNI_KAT".Tramites
(
	Pro_Pro_Con 			SMALLSERIAL  								,

	Dep_Cve 				SMALLINT 	NOT NULL 						,
	Tpo_Tra_Cve 			SMALLINT  	NOT NULL 						,
	Pro_Pro_Id  			SMALLINT 	NOT NULL 						,
	Pro_Version 			SMALLINT 	DEFAULT 1 						,

-- Descripcion Adninistrativa del tramite

	Pro_Pro_Nom 			"public".DOM_NOM							,
	Pro_Pro_Cod 			VARCHAR(25) 								,
	Pro_Pro_Des 			"public".DOM_DES							,
	Pro_Pro_Pago 			BOOLEAN  									,	
--	Pro_Pro_Fundamento 		TEXT  		NOT NULL 						,
--	Pro_Pro_Obs 			TEXT  		DEFAULT null					,

	Pro_Pro_Flujo 			BYTEA  		DEFAULT null					,
	Pro_Num_Tareas 			SMALLINT 	NOT NULL  DEFAULT 3				,
	Pro_Duracion  			SMALLINT 	CHECK ( Pro_Duracion > 0) 		,
	Pro_Prevencion 			SMALLINT 	CHECK ( Pro_Prevencion > 0) 	,
	Pro_Negativo 			SMALLINT 	CHECK ( Pro_Negativo > 0) 		,
	Pro_Vig_Version 		BOOLEAN  									,
	Pro_Fec_Ini_Vig_Ver 	TIMESTAMP 	DEFAULT now() NOT NULL 			,
	Pro_Fec_Fin_Vig_Ver 	TIMESTAMP 	DEFAULT null					,
	Pro_Estatus_Ver 		BOOLEAN  	NOT NULL DEFAULT true  			,
	Per_Dpa_Con 			SMALLINT 	NOT NULL 						,

	Usr_Cve					VARCHAR(25)  NOT NULL DEFAULT 'UNI'			,
	Est_Act 				BOOLEAN 	 NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 							,

	CONSTRAINT 				Pro_Pro_Con_PK 	PRIMARY KEY (Pro_Pro_Con)  ,
	CONSTRAINT 				Tpo_Tra_Cve_FK 	FOREIGN KEY (Tpo_Tra_Cve) REFERENCES "UNI_KAT".Tipos_Tramites (Tpo_Tra_Cve) ON DELETE NO ACTION ON UPDATE NO ACTION ,
	CONSTRAINT 				Per_Are_Con_FK 	FOREIGN KEY (Per_Dpa_Con) REFERENCES "ADM".Res_Perfiles_Areas (Per_Dpa_Con) ON DELETE NO ACTION ON UPDATE NO ACTION
) 
WITH (OIDS=FALSE); 

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Tramites 							IS 'Catalogo General de Tramites y Servicios administrativos de Catastro/RPP/Desarrollo Urbano' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Con 				IS 'Consecutivo de los procesos y las versiones del Proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites.Dep_Cve 					IS 'Identificacion de la Dependencia propietaria del tramite' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Tpo_Tra_Cve 				IS 'Clave del tipo de tramite: 1: Front Desk; 2: Back End' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Id 				IS 'Identificacion del Proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Version 				IS 'Version del Proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Nom 				IS 'Nombre oficial del Proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Cod 				IS 'Codigo adminsitrativo del proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Des 				IS 'Descripcion del Proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Pago 				IS 'Pago para ejecutar el proceso' ;

--COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Fundamento 		IS 'Fundamento Legal y reglamentario del proceso' ;
--COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Obs 				IS 'Observaciones del proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Pro_Flujo 				IS 'Diagrama del Flujo General Autorizado y vigente del proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Num_Tareas 			IS 'Numero de tareas de la version del proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Duracion 				IS 'Tiempor de respuesta respuesta al promovente en dias habiles' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Prevencion 			IS 'Numero de dias para espera solventacion del solicitante en prevencion' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Negativo 				IS 'Numero de dias para negativo' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Vig_Version 			IS 'Situacion de la vigencia de la version: Verdadero Vigente; Falso Caducada' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Fec_Ini_Vig_Ver 		IS 'Fecha de inicio de la vigencia del proceso/version' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Fec_Fin_Vig_Ver 		IS 'Fecha de termino de la vigencia del proceso/version' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Pro_Estatus_Ver 			IS 'Estatus general del proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Per_Dpa_Con				IS 'Identificacion del perfil y el area con derecho a invocar el proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites.Usr_Cve 					IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Est_Act 					IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Tramites.Fec_Mod 					IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Pro_Pro_Con_PK 							ON "UNI_KAT".Tramites IS 'Llave Primaria de la tabla "UNI_KAT".Tramites';
COMMENT ON CONSTRAINT Tpo_Tra_Cve_FK 							ON "UNI_KAT".Tramites IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Tipos_Tramites';

ALTER TABLE "UNI_KAT".Tramites OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE INSUMOS GENERAL INSUMOS DETALLADOS
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists 		"UNI_KAT".Tpo_Tramite CASCADE;

CREATE 	TYPE 				"UNI_KAT".Tpo_Tramite AS 
(
	Pro_Pro_Con 			VARCHAR(254) ,

	Dep_Cve 					VARCHAR(254) ,
	Tpo_Tra_Cve 			VARCHAR(254) ,

	Pro_Pro_Id 				VARCHAR(254) ,
	Pro_Version				VARCHAR(254) ,

	Pro_Pro_Nom  			VARCHAR(254) , 			
	Pro_Pro_Cod 			VARCHAR(254) , 				
	Pro_Pro_Des 			VARCHAR(254) , 			
	--Pro_Pro_Pago 			VARCHAR(254) , 			
	--Pro_Pro_Fundamento 		VARCHAR(254) , 	 		
	--Pro_Pro_Obs 			VARCHAR(254) , 			

	Pro_Pro_Flujo 			VARCHAR(254) , 			
	Pro_Num_Tareas 			VARCHAR(254) , 			
	Pro_Duracion  			VARCHAR(254) , 			
	Pro_Prevencion 			VARCHAR(254) , 			
	Pro_Negativo 			VARCHAR(254) , 			
	Pro_Vig_Version 		VARCHAR(254) , 			
	Pro_Fec_Ini_Vig_Ver 	VARCHAR(254) , 		
	Pro_Fec_Fin_Vig_Ver 	VARCHAR(254) , 	
	Pro_Estatus_Ver 		VARCHAR(254) , 		
	Prov_Admperfil_Id 		VARCHAR(254) , 			
	Prov_Are_Cve  			VARCHAR(254) 
);

COMMENT ON TYPE "UNI_KAT".Tpo_Tramite IS  'Tipo de Tramites o Servicios';

ALTER TYPE "UNI_KAT".Tpo_Tramite OWNER TO "UNI";
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE LOS TRAMITES O SERVICIOS DETALLADOS POR TAREAS ----------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Tramites_Detalle CASCADE;

CREATE 	TABLE 				"UNI_KAT".Tramites_Detalle
(
	Pro_Tar_Con 			SMALLSERIAL								,
	Pro_Pro_Con 			SMALLINT  NOT NULL 						,

	Pro_Tar_Cve 			SMALLINT  NOT NULL 						,
	Pro_Tar_Id   			SMALLINT  NOT NULL 						,
	Pro_Tar_Plan_Ord 		SMALLINT  NOT NULL 						,
	Pro_Tar_Plan_Ant 		SMALLINT  NOT NULL 						,
	Pro_Tar_Plan_Pos 		SMALLINT  NOT NULL 						,
	Tpo_Ele_Cve 			SMALLINT  NOT NULL 						,
	Pro_Tar_Des_Condicion 	SMALLINT  DEFAULT null 					,
	Pro_Tar_Tmo_Res_Esp 	SMALLINT  DEFAULT 1 					,
	Pro_Tar_Req 			SMALLINT  DEFAULT null 					,

	Vta_Cve 				SMALLINT  DEFAULT null 					,
	Per_Dpa_Con 			SMALLINT 	NOT NULL 					,
	
	Usr_Cve					VARCHAR(25)  NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN  NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Pro_Tar_Con_PK 		PRIMARY KEY (Pro_Tar_Con) ,
	CONSTRAINT 				Pro_Pro_Con_FK_02 	FOREIGN KEY (Pro_Pro_Con) 	REFERENCES "UNI_KAT".Tramites (Pro_Pro_Con) 		ON DELETE NO ACTION ON UPDATE NO ACTION ,
	CONSTRAINT 				Tpo_Ele_Cve_FK 		FOREIGN KEY (Tpo_Ele_Cve) 	REFERENCES "UNI_KAT".Tipos_Elementos (Tpo_Ele_Cve) 	ON DELETE NO ACTION ON UPDATE NO ACTION ,
	CONSTRAINT 				Per_Dpa_Con_FK 		FOREIGN KEY (Per_Dpa_Con) 	REFERENCES "ADM".Res_Perfiles_Areas (Per_Dpa_Con) 	ON DELETE NO ACTION ON UPDATE NO ACTION ,
	CONSTRAINT 				Vta_Cve_FK_02 		FOREIGN KEY (Vta_Cve) 		REFERENCES "UNI_KAT".Vistas (Vta_Cve) 				ON DELETE NO ACTION ON UPDATE NO ACTION

) 
WITH (OIDS=FALSE);

-- Indices de la tabla:

CREATE INDEX Pro_Tar_Con_IDX ON "UNI_KAT".Tramites_Detalle  (Pro_Tar_Con ASC ) ;

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Tramites_Detalle 							IS 'Catalogo Especifico de las tareas de los Procesos administrativos de Catastro/RPP/Desarrollo Urbano' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Con 				IS 'Consecutivo del proceso/tarea del proceso determinado' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Pro_Con 				IS 'Consecutivo de los procesos y las versiones del Proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Cve 				IS 'Clave del proceso/tarea del proceso determinado' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Id 				IS 'Identificacion del Proceso/Tarea' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Plan_Ord 			IS 'Orden de la tarea' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Plan_Ant 			IS 'Tarea anterior' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Plan_Pos 			IS 'Tarea Posterior' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Tpo_Ele_Cve 				IS 'Clave del Tipo del elemento' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Des_Condicion		IS 'Condicion logica ' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Tmo_Res_Esp 		IS 'Tiempo de respuesta esperado de la tarea' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Pro_Tar_Req 				IS 'Indica si es posible turnar cuando se crea un proceso dentro de otro proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Vta_Cve 					IS 'URL de la Vista de cada tarea especifica de cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Per_Dpa_Con 				IS 'Identificacion del perfil y del area con derecho a invocar la tarea del proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Usr_Cve 					IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Est_Act 					IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Detalle.Fec_Mod 					IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Pro_Tar_Con_PK 									ON "UNI_KAT".Tramites_Detalle IS 'Llave Primaria de la tabla Tramites_Detalle';
COMMENT ON CONSTRAINT Pro_Pro_Con_FK_02 								ON "UNI_KAT".Tramites_Detalle IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Tramites';
COMMENT ON CONSTRAINT Tpo_Ele_Cve_FK 									ON "UNI_KAT".Tramites_Detalle IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Tipos_Elementos';

ALTER TABLE "UNI_KAT".Tramites_Detalle OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE LOS TRAMITES O SERVICIOS DETALLADOS POR TAREAS ----------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists 		"UNI_KAT".Tpo_Tramite_Det CASCADE;

CREATE 	TYPE 				"UNI_KAT".Tpo_Tramite_Det AS 
(
	Pro_Tar_Con 			VARCHAR(254) 	,

	Pro_Pro_Con 			VARCHAR(254) 	,
	Pro_Tar_Cve 			VARCHAR(254) 	,

	Pro_Tar_Id 				VARCHAR(254) 	,
	Pro_Tar_Plan_Ord		VARCHAR(254)	,
	Pro_Tar_Plan_Ant  		VARCHAR(254) 	, 			
	Pro_Tar_Plan_Pos 		VARCHAR(254) 	, 				
	Tpo_Ele_Cve 			VARCHAR(254) 	, 			
	Pro_Tar_Des_Condicion 	VARCHAR(254) 	, 

	Vta_Cve 				VARCHAR(254) 	, 	 		
	Per_Dpa_Con				VARCHAR(254) 	,

	Pro_Tar_Tmo_Res_Esp		VARCHAR(254) 	, 			
	Pro_Tar_Req  			VARCHAR(254)
);

COMMENT ON 	TYPE "UNI_KAT".Tpo_Tramite_Det IS  'Tipo de Tramites o Servicios' ;

ALTER 		TYPE "UNI_KAT".Tpo_Tramite_Det OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE REQUERIMIENTOS DETALLADOS
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Tramites_Requerimientos_Detalle CASCADE;

CREATE 	TABLE 				"UNI_KAT".Tramites_Requerimientos_Detalle
(
	Req_Det_Con 			SMALLSERIAL 	 								,
	
	Pro_Pro_Con 			SMALLINT  	NOT NULL 							,
	Req_Det_Cve 			SMALLINT  	NOT NULL 							,

	Req_Det_Req 			VARCHAR(254)  									,
	Req_Det_Reg_Pag 		VARCHAR(254)  									,
	Req_Det_Importe 		NUMERIC(30,6) CHECK ( Req_Det_Importe >= 0.0) 	,

	Usr_Cve					VARCHAR(25)  	NOT NULL DEFAULT 'UNI'			,
	Est_Act 				BOOLEAN 		NOT NULL DEFAULT true  			, 
	Fec_Mod 				"public".DOM_FEC 								,

	CONSTRAINT 				Req_Det_Cve_PK 	PRIMARY KEY (Pro_Pro_Con, Req_Det_Cve) ,
	CONSTRAINT 				Pro_Pro_Con_FK 	FOREIGN KEY (Pro_Pro_Con) REFERENCES "UNI_KAT".Tramites (Pro_Pro_Con)  ON DELETE NO ACTION ON UPDATE NO ACTION
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Tramites_Requerimientos_Detalle 					IS 'Catalogo de detalle de los requerimientos juridicos y administrativos de cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Req_Det_Con 		IS 'Consecutivo de los requerimientos de cada proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Pro_Pro_Con 		IS 'Consecutivo de los procesos y las versiones del Proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Req_Det_Cve 		IS 'Clave consecutiva de los requerimientos de cada proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Req_Det_Req 		IS 'Descripcion de los requerimientos de cada proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Req_Det_Reg_Pag 	IS 'Genera pago verdadero; Exento falso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Req_Det_Importe 	IS 'Costo/Tarifa/Derechos del proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Usr_Cve 			IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Est_Act 			IS 'Estado del registro: Activo o Inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Requerimientos_Detalle.Fec_Mod 			IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Req_Det_Cve_PK 											ON "UNI_KAT".Tramites_Requerimientos_Detalle IS 'Llave Primaria de la tabla "UNI_KAT".Tramites_Requerimientos_Detalle';
COMMENT ON CONSTRAINT Pro_Pro_Con_FK 											ON "UNI_KAT".Tramites_Requerimientos_Detalle IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Tramites';

ALTER TABLE "UNI_KAT".Tramites_Requerimientos_Detalle OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE REQUERIMIENTOS DETALLADOS -------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Requerimiento CASCADE;

CREATE 	TYPE 			"UNI_KAT".Tpo_Requerimiento AS 
(
	Req_Det_Con 				VARCHAR(254) 		,

	Pro_Pro_Con 				VARCHAR(254) 		,
	Req_Det_Cve 				VARCHAR(254) 		,

	Req_Det_Req 				VARCHAR(254) 		,
	Req_Det_Reg_Pag				VARCHAR(254)		,
	Req_Det_Importe 			VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Requerimiento IS  'Tipo de Requerimientos detallados de los tramites' ;

ALTER TYPE "UNI_KAT".Tpo_Requerimiento OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE VARIANTES O MATICES DE LOS TRAMITES O SERVICIOS ---------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Tramites_Variantes CASCADE;

CREATE 	TABLE 				"UNI_KAT".Tramites_Variantes
(
	Var_Pro_Con				SMALLSERIAL								,

	Pro_Pro_Con				SMALLINT  NOT NULL 						,
	Var_Pro_Cve 			SMALLINT  NOT NULL 						,

	Var_Pro_Nom				"public".DOM_DES						,
	Var_Pro_Des 			TEXT  		NOT NULL 					,

	Usr_Cve					VARCHAR(25)  NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	 NOT NULL DEFAULT true  	, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Var_Pro_Cve_PK 		PRIMARY KEY (Pro_Pro_Con, Var_Pro_Cve) ,
	CONSTRAINT 				Pro_Pro_Con_FK_01 	FOREIGN KEY (Pro_Pro_Con) REFERENCES "UNI_KAT".Tramites (Pro_Pro_Con) ON DELETE NO ACTION ON UPDATE NO ACTION
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Tramites_Variantes 				IS 'Catalogo de los variantes de un proceso, normalmente para referencia' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Var_Pro_Con 	IS 'Consecutivo de los variantes de un proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Pro_Pro_Con 	IS 'Consecutivo de los procesos y las versiones del Proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Var_Pro_Cve 	IS 'Clave de los variantes de un proceso' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Var_Pro_Nom 	IS 'Nombre de la variante u opcion' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Var_Pro_Des 	IS 'Descripcion de las variantes de un proceso' ;

COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Usr_Cve 		IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Est_Act 		IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Tramites_Variantes.Fec_Mod 		IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Var_Pro_Cve_PK 						ON "UNI_KAT".Tramites_Variantes IS 'Llave Primaria de la tabla Tramites_Variantes';
COMMENT ON CONSTRAINT Pro_Pro_Con_FK_01 					ON "UNI_KAT".Tramites_Variantes IS 'Llave Foranea que apunta desde la tabla "UNI_KAT".Tramites';

ALTER TABLE "UNI_KAT".Tramites_Variantes OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- ESTRUCTURA TYPE PARA DE VARIANTES O MATICES DE LOS TRAMITES O SERVICIOS ---------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Variante CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Variante AS 
(
	Var_Pro_Con 				VARCHAR(254) 		,

	Pro_Pro_Con 				VARCHAR(254) 		,
	Var_Pro_Cve 				VARCHAR(254) 		,
	Var_Pro_Nom					VARCHAR(254)		,
	Var_Pro_Des 				VARCHAR(254) 
);

COMMENT ON TYPE "UNI_KAT".Tpo_Variante IS  'Tipo de Variantes u opciones de los tramites' ;

ALTER TYPE "UNI_KAT".Tpo_Variante OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE LOS ESTADOS ADMINISTRATIVOS DE LOS TRAMITES O SERVICIOS -------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Estatus_Tramites CASCADE;

CREATE 	TABLE 				"UNI_KAT".Estatus_Tramites
(
	Est_Tra_Cve 			SMALLSERIAL  						,
	Est_Tra_Des 			"public".DOM_DES 					,
	Est_Tra_Img_Pro 		varchar(254) DEFAULT null 			,

	Usr_Cve					VARCHAR(25) NOT NULL DEFAULT 'UNI'	,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  	, 
	Fec_Mod 				"public".DOM_FEC 					,

	CONSTRAINT 				Est_Tra_Cve_PK PRIMARY KEY (Est_Tra_Cve) ,
	CONSTRAINT 				Est_Tra_Des_UNQ	UNIQUE 	(Est_Tra_Des)
)
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Estatus_Tramites					IS 'Catalogo de los estados administrativos de los tramites y servicios';
COMMENT ON COLUMN "UNI_KAT".Estatus_Tramites.Est_Tra_Cve 		IS 'Clave consecutiva estados administrativos de los tramites y servicios';
COMMENT ON COLUMN "UNI_KAT".Estatus_Tramites.Est_Tra_Des 		IS 'Descripcion unica del Estatus de la actividad o tarea actual: [c]reado, En [P]roceso, En [R]eproceso, [S]uspendido (por prevencion), [T]erminado Positivo, Terminado [N]egativo, [C]ancelado';
COMMENT ON COLUMN "UNI_KAT".Estatus_Tramites.Est_Tra_Img_Pro 	IS 'Imagen unica estados administrativos de los tramites y servicios';

COMMENT ON COLUMN "UNI_KAT".Estatus_Tramites.Usr_Cve			IS 'Ultimo usuario que administro el Catalogo, insercion, modificacion o baja logica';
COMMENT ON COLUMN "UNI_KAT".Estatus_Tramites.Est_Act 			IS 'Estado del registro: Activo o Inactivo';
COMMENT ON COLUMN "UNI_KAT".Estatus_Tramites.Fec_Mod 			IS 'Fecha de la ultima operacion de actualizacion del Catalogo';

COMMENT ON CONSTRAINT Est_Tra_Cve_PK 							ON "UNI_KAT".Estatus_Tramites IS 'Llave Primaria de la tabla Estatus_Tramite';
COMMENT ON CONSTRAINT Est_Tra_Des_UNQ 							ON "UNI_KAT".Estatus_Tramites IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Estatus_Tramites OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- Type structure for DE LOS ESTADOS ADMINISTRATIVOS DE LOS TRAMITES O SERVICIOS ---------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Estatus_Tramite CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Estatus_Tramite AS 
(
	Est_Tra_Cve 				VARCHAR(254) 		,

	Est_Tra_Des 				VARCHAR(254) 		,
	Est_Tra_Img_Pro 			VARCHAR(254) 	
);

COMMENT ON TYPE "UNI_KAT".Tpo_Estatus_Tramite IS  'Estados administrativos de los tramites y servicios' ;

ALTER TYPE "UNI_KAT".Tpo_Estatus_Tramite OWNER TO "UNI"; 
*/
-- ---------------------------------------------------------------------------------------------------------------------------
-- CATALOGO DE LA SITUACION DE LAS TAREAS DE CADA TRAMITE O SERVICIO ---------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

DROP 	TABLE if exists 	"UNI_KAT".Situacion_Tareas CASCADE;

CREATE 	TABLE 				"UNI_KAT".Situacion_Tareas
(
	Sit_Tar_Cve 			SMALLSERIAL  							,
	Sit_Tar_Des 			"public".DOM_DES						,

	Usr_Cve					VARCHAR(25)  NOT NULL DEFAULT 'UNI'		,
	Est_Act 				BOOLEAN 	NOT NULL DEFAULT true  		, 
	Fec_Mod 				"public".DOM_FEC 						,

	CONSTRAINT 				Sit_Tar_Cve_PK PRIMARY KEY (Sit_Tar_Cve) ,
	CONSTRAINT 				Sit_Tar_Des_UNQ UNIQUE 	(Sit_Tar_Des)
) 
WITH (OIDS=FALSE);

-- Comentarios de tabla y los campos: 

COMMENT ON TABLE  "UNI_KAT".Situacion_Tareas 				IS 'Catalogo de la situacion operativa de cada tarea de los procesos' ;
COMMENT ON COLUMN "UNI_KAT".Situacion_Tareas.Sit_Tar_Cve 	IS 'Clave del Tipo del situacion' ;
COMMENT ON COLUMN "UNI_KAT".Situacion_Tareas.Sit_Tar_Des 	IS 'Descripcion unica del Estatus de la actividad o tarea actual: [c]reado, En [P]roceso, En [R]eproceso, [S]uspendido (por prevencion), [T]erminado Positivo, Terminado [N]egativo, [C]ancelado' ;

COMMENT ON COLUMN "UNI_KAT".Situacion_Tareas.Usr_Cve 		IS 'Ultimo usuario que administro el catalogo, insercion, modificacion o baja logica' ;
COMMENT ON COLUMN "UNI_KAT".Situacion_Tareas.Est_Act 		IS 'Estado del registro: Activo o inactivo' ;
COMMENT ON COLUMN "UNI_KAT".Situacion_Tareas.Fec_Mod 		IS 'Fecha de la ultima operacion de administracion del catalogo' ;

COMMENT ON CONSTRAINT Sit_Tar_Cve_PK 						ON "UNI_KAT".Situacion_Tareas IS 'Llave Primaria de la tabla Situacion_Tareas';
COMMENT ON CONSTRAINT Sit_Tar_Des_UNQ 						ON "UNI_KAT".Situacion_Tareas IS 'Valor unico del campo seleccionado, sin duplicados';

ALTER TABLE "UNI_KAT".Situacion_Tareas OWNER TO  "UNI"; 

-- ---------------------------------------------------------------------------------------------------------------------------
-- Type structure for DE LA SITUACION DE LAS TAREAS DE CADA TRAMITE O SERVICIO -----------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
/*
DROP 	TYPE if exists "UNI_KAT".Tpo_Situacion_Tarea CASCADE;

CREATE 	TYPE "UNI_KAT".Tpo_Situacion_Tarea AS 
(
	Sit_Tar_Cve 				VARCHAR(254) 		,
	Sit_Tar_Des 				VARCHAR(254)
);

COMMENT ON TYPE "UNI_KAT".Tpo_Situacion_Tarea IS  'Situacion operativa de cada tarea de los procesos' ;

ALTER TYPE "UNI_KAT".Tpo_Situacion_Tarea OWNER TO "UNI"; 
*/








-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE Usuarios CON PERFILES Y PUESTOS PARA LAS SESIONES ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE ESTATUS TRAMITES -------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Estatus_Tramite CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Estatus_Tramite AS

SELECT 
		T1.Est_Tra_Cve 						AS est_tra_id	, 
		UPPER(TRIM(T1.Est_Tra_Des)::text)  	AS est_tra_nom	, 
		T1.Est_Tra_Img_Pro 					AS est_tra_img
		
FROM 	"UNI_KAT".Estatus_Tramites AS T1

WHERE	T1.Est_Act IS true 

ORDER BY est_tra_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Estatus_Tramite						IS 'Vista de los estados de los tramites';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Estatus_Tramite.est_tra_id			IS 'Clave de Tipos de elementos graficos' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Estatus_Tramite.est_tra_nom 			IS 'Nombre de elementos graficos';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Estatus_Tramite.est_tra_img 			IS 'Objeto de los Tipos de elementos graficos';

ALTER VIEW "UNI_KAT".VW_Qry_Estatus_Tramite OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE PERFILES Y AREAS -------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Res_Vista_Seccion CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Res_Vista_Seccion AS

SELECT 
		T1.Vta_Sec_Con 						AS vta_sec_id	,

		T1.Vta_Cve 							AS vta_sec_vta_id	,		 
		T1.Sec_Cve 							AS vta_sec_sec_id ,
		UPPER(TRIM(T1.Vta_Sec_URL)::text)  	AS vta_sec_url

FROM 	"UNI_KAT".Res_Vistas_Secciones AS T1

WHERE	T1.Est_Act IS true 

ORDER BY vta_sec_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Res_Vista_Seccion					IS 'Vista de los Perfiles y Areas';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Res_Vista_Seccion.vta_sec_id			IS 'Clave de Tipos de elementos graficos' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Res_Vista_Seccion.vta_sec_vta_id 	IS 'Nombre de elementos graficos';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Res_Vista_Seccion.vta_sec_sec_id 	IS 'Objeto de los Tipos de elementos graficos';

ALTER VIEW "UNI_KAT".VW_Qry_Res_Vista_Seccion OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE SECCIONES --------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Seccion CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Seccion AS

SELECT 
		T1.Sec_Con 						AS sec_id	,

		T1.Sec_Cve 						AS sec_cve	,		 
		UPPER(TRIM(T1.Sec_Des)::text)  	AS vta_des

FROM 	"UNI_KAT".Secciones AS T1

WHERE	T1.Est_Act IS true 

ORDER BY sec_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Seccion			IS 'Vista de las secciones de codigo';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Seccion.sec_id	IS 'Clave de Tipos de elementos graficos' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Seccion.sec_cve 	IS 'Nombre de elementos graficos';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Seccion.vta_des 	IS 'Objeto de los Tipos de elementos graficos';

ALTER VIEW "UNI_KAT".VW_Qry_Seccion OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE VISTAS -----------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Vista CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Vista AS

SELECT 
		T1.Vta_Con 						AS vta_id	,

		T1.Vta_Cve 						AS vta_cve	,
		UPPER(TRIM(T1.Vta_Des)::text)  	AS vta_des

FROM 	"UNI_KAT".Vistas AS T1

WHERE	T1.Est_Act IS true 

ORDER BY vta_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Vista			IS 'Vista de las vistas de los procesos';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Vista.vta_id		IS 'Clave de Tipos de elementos graficos' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Vista.vta_cve 	IS 'Nombre de elementos graficos';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Vista.vta_des 	IS 'Objeto de los Tipos de elementos graficos';

ALTER VIEW "UNI_KAT".VW_Qry_Vista OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE SITUACION TAREAS -------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Situacion_Tarea CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Situacion_Tarea AS

SELECT 
		T1.Sit_Tar_Cve 						AS Sit_Tar_id	, 
		UPPER(TRIM(T1.Sit_Tar_Des)::text)  	AS Sit_Tar_nom	
		
FROM 	"UNI_KAT".Situacion_Tareas AS T1

WHERE	T1.Est_Act IS true 

ORDER BY Sit_Tar_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Situacion_Tarea					IS 'Vista de Tipos de elementos graficos de negocios';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Situacion_Tarea.Sit_Tar_id		IS 'Clave de Tipos de elementos graficos' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Situacion_Tarea.Sit_Tar_nom 		IS 'Tipos de elementos graficos';

ALTER VIEW "UNI_KAT".VW_Qry_Situacion_Tarea OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE TIPOS DE ELEMENTOS -----------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Tipo_Elemento CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Tipo_Elemento AS

SELECT 
		T1.Tpo_Ele_Cve 						AS ele_id	, 
		UPPER(TRIM(T1.Tpo_Ele_Des)::text)  	AS ele_nom	, 
		T1.Tpo_Ele_Des_Grafico 				AS ele_obj
		
FROM 	"UNI_KAT".Tipos_Elementos AS T1

WHERE	T1.Est_Act IS true 

ORDER BY ele_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Tipo_Elemento			IS 'Vista de Tipos de elementos graficos de negocios';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tipo_Elemento.ele_id		IS 'Clave de Tipos de elementos graficos' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tipo_Elemento.ele_nom 	IS 'Tipos de elementos graficos';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tipo_Elemento.ele_obj 	IS 'Objeto de los Tipos de elementos graficos';

ALTER VIEW "UNI_KAT".VW_Qry_Tipo_Elemento OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE TIPOS DE TRAMITES O SERVICIOS ------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Tipo_Tramite CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Tipo_Tramite AS

SELECT 
		T1.Tpo_Tra_Cve 						AS tra_id	, 
		UPPER(TRIM(T1.Tpo_Ser_Des)::text)  	AS tpo_tramite
		
FROM 	"UNI_KAT".Tipos_Tramites AS T1

WHERE	T1.Est_Act IS true 

ORDER BY tra_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Tipo_Tramite				IS 'Vista de Tipos de Tramites del GEV';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tipo_Tramite.tra_id		IS 'Clave de Tipos de Tramites del GEV' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tipo_Tramite.tpo_tramite IS 'Tipos de Tramites del GEV';

ALTER VIEW "UNI_KAT".VW_Qry_Tipo_Tramite OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA -----------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Insumo_General CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Insumo_General AS

SELECT 
		T1.Ins_Gen_Cve 						AS ins_id	, 
		UPPER(TRIM(T1.Ins_Gen_Des)::text)  	AS ins_des	, 
		UPPER(TRIM(T1.Ins_Gen_Tpo)::text)  	AS ins_tpo	, 
		UPPER(TRIM(T1.Ins_Gen_Dir)::text)  	AS ins_dir
		
FROM 	"UNI_KAT".Insumos_Generales AS T1

WHERE	T1.Est_Act IS true 

ORDER BY ins_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Insumo_General			IS 'Vista de los insumos generales';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General.ins_id	IS 'Clave de los insumos generales' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General.ins_des 	IS 'Descripcion de los insumos generales';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General.ins_tpo 	IS 'Tipos de los insumos generales';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General.ins_dir 	IS 'Directorio base de los insumos generales';

ALTER VIEW "UNI_KAT".VW_Qry_Insumo_General OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA -----------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Insumo_General_Det CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Insumo_General_Det AS

SELECT 
		T1.Ins_Det_Con 						AS ins_det_id	, 
		T1.Ins_Gen_Cve 						AS ins_gen_id	, 
		T1.Ins_Det_Cve 						AS ins_det_cve	, 	
			
		UPPER(TRIM(T1.Ins_Det_Des)::text)  	AS ins_det_des	, 
		UPPER(TRIM(T1.Ins_Det_Tpo)::text)   AS ins_det_tpo	, 
		T1.Ins_Det_No_Copias  				AS ins_det_cop ,
		T1.Ins_Det_No_Original 				AS ins_det_ori  ,
		UPPER(TRIM(T1.Ins_Det_Dir)::text)  	AS ins_det_dir
		
FROM 	"UNI_KAT".Insumos_Generales_Detalle AS T1

WHERE	T1.Est_Act IS true 

ORDER BY ins_det_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Insumo_General_Det				IS 'Vista de insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_id	IS 'Consecutivo de insumos generales detallados' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_gen_id	IS 'Clave de insumos generales ' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_cve	IS 'Clave de insumos generales detallados' ;

COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_des 	IS 'Descricpion de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_tpo 	IS 'Tipo de  los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_cop 	IS 'No de copias de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_ori 	IS 'No de originales de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Insumo_General_Det.ins_det_dir 	IS 'Directorio de los insumos generales detallados';

ALTER VIEW "UNI_KAT".VW_Qry_Insumo_General_Det OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE LOS RESULTADOS O PRODUCTOS GENERAL -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Resultado_General CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Resultado_General AS

SELECT 
		T1.Res_Gen_Cve 						AS res_id	, 
		UPPER(TRIM(T1.Res_Gen_Des)::text)  	AS res_des	, 
		UPPER(TRIM(T1.Res_Gen_Tpo)::text)  	AS res_tpo	, 
		UPPER(TRIM(T1.Res_Gen_Dir)::text)  	AS res_dir
		
FROM 	"UNI_KAT".Resultados_Generales AS T1

WHERE	T1.Est_Act IS true 

ORDER BY res_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Resultado_General			IS 'Vista de los resultados o productos generales';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General.res_id		IS 'Clave de los resultados o productos  generales' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General.res_des 	IS 'Descripcion de los resultados o productos  generales';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General.res_tpo 	IS 'Tipos de los resultados o productos  generales';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General.res_dir 	IS 'Directorio base de los resultados o productos  generales';

ALTER VIEW "UNI_KAT".VW_Qry_Resultado_General OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE RESULTADOS O PRODUCTOS DETALLADO ---------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Resultado_General_Det CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Resultado_General_Det AS

SELECT 
		T1.Res_Det_Con 						AS res_det_id	, 
		T1.Res_Gen_Cve 						AS res_gen_id	, 
		T1.Res_Det_Cve 						AS res_det_cve	, 	
			
		UPPER(TRIM(T1.Res_Det_Des)::text)  	AS res_det_des	, 
		UPPER(TRIM(T1.Res_Det_Tpo)::text) 	AS res_det_tpo	, 
		UPPER(TRIM(T1.Res_Det_Dir)::text)  	AS res_det_dir
		
FROM 	"UNI_KAT".Resultados_Generales_Detalle AS T1

WHERE	T1.Est_Act IS true 

ORDER BY res_det_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Resultado_General_Det				IS 'Vista de insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General_Det.res_det_id		IS 'Consecutivo de insumos generales detallados' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General_Det.res_gen_id		IS 'Clave de insumos generales ' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General_Det.res_det_cve	IS 'Clave de insumos generales detallados' ;

COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General_Det.res_det_des 	IS 'Descricpion de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General_Det.res_det_tpo 	IS 'Tipo de  los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Resultado_General_Det.res_det_dir 	IS 'Directorio de los insumos generales detallados';

ALTER VIEW "UNI_KAT".VW_Qry_Resultado_General_Det OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE TRAMITES O SERVICIOS ---------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Tramite CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Tramite AS

SELECT 
	T1.Pro_Pro_Con 								AS tra_id	, 
	T1.Dep_Cve 									AS Dep_Cve	, 
	T1.Tpo_Tra_Cve 								AS tpo_tra_cve	, 	
	T1.Pro_Pro_Id  								AS tra_tra_id	, 
	T1.Pro_Version 								AS tra_ver	, 
	UPPER(TRIM(T1.Pro_Pro_Nom)::text) 			AS tra_nom	, 
	UPPER(TRIM(T1.Pro_Pro_Cod)::text) 			AS tra_cod	, 
	UPPER(TRIM(T1.Pro_Pro_Des)::text) 			AS tra_des	, 
--	T1.Pro_Pro_Pago 							AS tra_pag	, 
--	UPPER(TRIM(T1.Pro_Pro_Fundamento)::text) 	AS tra_fun	, 
--	UPPER(TRIM(T1.Pro_Pro_Obs)::text) 			AS tra_obs	, 
	T1.Pro_Pro_Flujo 							AS tra_flu	, 
	T1.Pro_Num_Tareas 							AS tra_tar	, 
	T1.Pro_Duracion  							AS tra_dur	, 	
	T1.Pro_Prevencion 							AS tra_pre	, 	
	T1.Pro_Negativo 							AS tra_neg	,  	
	T1.Pro_Vig_Version 							AS tra_vig	,  	
	T1.Pro_Fec_Ini_Vig_Ver 						AS tra_ini	,  	
	T1.Pro_Fec_Fin_Vig_Ver 						AS tra_fin	,  	
	T1.Pro_Estatus_Ver 							AS tra_est	, 
	T1.Per_Dpa_Con 								AS Perfil_Area 

FROM 	"UNI_KAT".Tramites AS T1

WHERE	T1.Est_Act IS true 

ORDER BY tra_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Tramite				IS 'Vista de los tramites o servicios';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite.tra_id		IS 'Consecutivo de insumos generales detallados' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite.Dep_Cve		IS 'Clave de insumos generales ' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite.tpo_tra_cve	IS 'Clave de insumos generales detallados' ;

COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite.tra_tra_id 	IS 'Descricpion de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite.tra_ver 		IS 'Tipo de  los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite.tra_nom 		IS 'Directorio de los insumos generales detallados';

ALTER VIEW "UNI_KAT".VW_Qry_Tramite OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE LOS REQUERIMIENTOS DETALLADOS ------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Tramite_requerimiento_Det CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Tramite_requerimiento_Det AS

SELECT 
		T1.Req_Det_Con 							AS req_det_id	, 
		
		T1.Pro_Pro_Con 							AS req_gen_id	, 
		T1.Req_Det_Cve 							AS req_det_cve	, 	
			
		UPPER(TRIM(T1.Req_Det_Req)::text)  		AS req_det_des	, 
		UPPER(TRIM(T1.Req_Det_Reg_Pag)::text) 	AS req_det_tpo	, 
		T1.Req_Det_Importe  					AS req_det_imp
		
FROM 	"UNI_KAT".Tramites_Requerimientos_Detalle AS T1

WHERE	T1.Est_Act IS true 

ORDER BY req_det_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Tramite_requerimiento_Det				IS 'Vista de los requerimientos detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_requerimiento_Det.req_det_id		IS 'Consecutivo de insumos generales detallados' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_requerimiento_Det.req_gen_id		IS 'Clave de insumos generales ' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_requerimiento_Det.req_det_cve	IS 'Clave de insumos generales detallados' ;

COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_requerimiento_Det.req_det_des 	IS 'Descricpion de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_requerimiento_Det.req_det_tpo 	IS 'Tipo de  los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_requerimiento_Det.req_det_imp 	IS 'Directorio de los insumos generales detallados';

ALTER VIEW "UNI_KAT".VW_Qry_Tramite_requerimiento_Det OWNER TO "UNI";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE LOS TRAMITES O SERVICIOS DETALLADOS POR TAREAS  ------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Tramite_Det CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Tramite_Det AS

SELECT 
	T1.Pro_Tar_Con 										AS tra_det_con	,

	T1.Pro_Pro_Con 										AS tra_pro_con	, 
	T1.Pro_Tar_Cve 										AS tra_det_cve	, 

	T1.Pro_Tar_Id 										AS tra_det_id	, 	
	T1.Pro_Tar_Plan_Ord  								AS tra_det_ord	, 
	T1.Pro_Tar_Plan_Ant 								AS tra_det_ant	, 
	T1.Pro_Tar_Plan_Pos 								AS tra_det_pos	, 
	T1.Tpo_Ele_Cve										AS tra_det_ele_cve	, 
	T1.Pro_Tar_Des_Condicion							AS tra_det_des	, 

	T1.Vta_Cve 											AS tra_det_per	, 
	T1.Per_Dpa_Con 										AS tra_det_are	, 

	T1.Pro_Tar_Tmo_Res_Esp 								AS tra_det_res	, 
	T1.Pro_Tar_Req  									AS tra_det_req

FROM 	"UNI_KAT".Tramites_Detalle AS T1

WHERE	T1.Est_Act IS true 

ORDER BY Pro_Tar_Con;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Tramite_Det						IS 'Vista de los tramites o servicios';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Det.tra_det_con			IS 'Consecutivo de insumos generales detallados' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Det.tra_pro_con			IS 'Clave de insumos generales ' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Det.tra_det_cve			IS 'Clave de insumos generales detallados' ;

COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Det.tra_det_id 			IS 'Descricpion de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Det.tra_det_ord 			IS 'Tipo de  los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Det.tra_det_ant 			IS 'Directorio de los insumos generales detallados';

ALTER VIEW "UNI_KAT".VW_Qry_Tramite_Det OWNER TO "UNI";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- VISTA DE LOS VARIANTES DE LOS TRAMITES ------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

DROP 		VIEW if exists 	"UNI_KAT".VW_Qry_Tramite_Variante CASCADE;

CREATE		VIEW 			"UNI_KAT".VW_Qry_Tramite_Variante AS

SELECT 
		t1.var_pro_con 							AS var_id,
		t1.pro_pro_con 							AS pro_id,
		t1.var_pro_cve 							AS var_cve,
		UPPER(BTRIM((t1.var_pro_nom)::text)) 	AS var_des,
		UPPER(BTRIM(t1.var_pro_des)::text) 		AS var_tpo

FROM 	"UNI_KAT".Tramites_Variantes AS T1

WHERE	T1.Est_Act IS true 

ORDER BY var_id;

-- Comentarios de vista y los campos: 

COMMENT ON  VIEW  "UNI_KAT".VW_Qry_Tramite_Variante				IS 'Vista de las variantes de los tramites';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Variante.var_id		IS 'Consecutivo de insumos generales detallados' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Variante.pro_id		IS 'Clave de insumos generales ' ;
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Variante.var_cve		IS 'Clave de insumos generales detallados' ;

COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Variante.var_des 	IS 'Descricpion de los insumos generales detallados';
COMMENT ON COLUMN "UNI_KAT".VW_Qry_Tramite_Variante.var_tpo 	IS 'Tipo de  los insumos generales detallados';

ALTER VIEW "UNI_KAT".VW_Qry_Tramite_Variante OWNER TO "UNI";




-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- TABLAS EN EL ESQUEMA "UNI_KAT"
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL

-- ---------------------------------------------------------------------------------------------------------------------------------
-- CONTENIDO -----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION FLUJO DE TRABAJO --------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- FUNCION DE TIPOS DE ELEMENTOS DEL MODELO DE PROCESO DE NEGOCIOS
-- FUNCION DE LOS TIPOS DE SERVICIO DE LOS TRAMITES O SERVICIOS
-- FUNCION DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA
-- FUNCION DE INSUMOS DETALLADOS
-- FUNCION DE RESULTADOS O PRODUCTOS GENERAL
-- FUNCION DE RESULTADOS O PRODUCTOS DETALLADO
-- FUNCION DE REQUERIMIENTOS DETALLADOS
-- FUNCION DE PROCESOS GENERALES O TRAMITES Y SERVICIOS
-- FUNCION DE VARIANTES O MATICES DE LOS TRAMITES O SERVICIOS
-- FUNCION DE LOS TRAMITES O SERVICIOS DETALLADOS POR TAREAS
-- FUNCION DE PROCESOS INVOCADOS CON PARAMETROS DE PADRON DE PREDIOS, PADRON DE PERSONAS Y PROCESO

-- TABLA RESOLUTIVA DE TAREAS CON INSUMOS
-- TABLA RESOLUTIVA DE TAREAS CON RESULTADOS O PRODUCTOS


 
 

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE TIPOS DE ELEMENTOS --------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Tpo_Elemento(smallint)
  RETURNS SETOF "UNI_KAT".tpo_tpo_elemento AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_tpo_elemento%ROWTYPE;

	BEGIN

	  SELECT 	ele_Id, ele_Nom, ele_obj  
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Tipo_Elemento AS T1
		WHERE 	cve = T1.ele_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Tipo de Elemento ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Tpo_Elemento(smallint) IS 'Funcion que devuelve los tipos de elementos de lps procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Tpo_Elemento(smallint) OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE TIPOS DE ELEMENTOS --------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Estatus_Tramite(smallint)
  RETURNS SETOF "UNI_KAT".Tpo_Estatus_Tramite AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".Tpo_Estatus_Tramite%ROWTYPE;

	BEGIN

	  SELECT 	est_tra_id, est_tra_nom, est_tra_img  
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Estatus_Tramite AS T1
		WHERE 	cve = T1.ele_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Tipo de Estatus Tramite ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Estatus_Tramite(smallint) IS 'Funcion que devuelve los estatus de tramites';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Estatus_Tramite(smallint) OWNER TO "UNI";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE TIPOS DE ELEMENTOS --------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Perfil_Area(smallint)
  RETURNS SETOF "ADM".Tpo_Perfil_Area AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"ADM".Tpo_Perfil_Area%ROWTYPE;

	BEGIN

	  SELECT 	est_tra_id, est_tra_nom, est_tra_img  
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Estatus_Tramite AS T1
		WHERE 	cve = T1.ele_Id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Tipo de Estatus Tramite ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Perfil_Area(smallint) IS 'Funcion que devuelve los estatus de tramites';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Perfil_Area(smallint) OWNER TO "UNI";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE TIPOS DE TRAMITES O SERVICIOS ----------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Tpo_Tramite(smallint)
  RETURNS SETOF "UNI_KAT".tpo_tpo_tramite AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_tpo_tramite%ROWTYPE;

	BEGIN

	  SELECT 	tra_id, tpo_tramite
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Tipo_Tramite AS T1
		WHERE 	cve = T1.tra_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Tipo de Tramite ( % ) no encontrada',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Tpo_Tramite(smallint) IS 'Funcion que devuelve los tipos de tramites o servicios';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Tpo_Tramite(smallint) OWNER TO "UNI";
 
-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA  ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Insumo_General(smallint)
  RETURNS SETOF "UNI_KAT".tpo_insumo_general AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_insumo_general%ROWTYPE;

	BEGIN

	  SELECT 	ins_id, ins_des, ins_tpo, ins_dir  
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Insumo_General AS T1
		WHERE 	cve = T1.ins_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Insumo General ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Insumo_General(smallint) IS 'Funcion que devuelve los tipos de elementos de lps procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Insumo_General(smallint) OWNER TO "UNI";
 
-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE INSUMOS GENERAL O ENTRADAS PARA CADA TAREA  ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Insumo_General_Det(smallint)
  RETURNS SETOF "UNI_KAT".tpo_insumo_general_det AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_insumo_general_det%ROWTYPE;

	BEGIN

	  SELECT 	ins_det_id, ins_gen_id, ins_det_cve, ins_det_des, ins_det_tpo, ins_det_cop, ins_det_ori, ins_det_dir   
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Insumo_General_Det AS T1
		WHERE 	cve = T1.ins_det_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Insumo General Detallado ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Insumo_General_Det(smallint) IS 'Funcion que devuelve los insumos generales detallados de los procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Insumo_General_Det(smallint) OWNER TO "UNI";
 
 -- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE LOS RESULTADOS O PRODUCTOS GENERAL  ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Resultado_General(smallint)
  RETURNS SETOF "UNI_KAT".tpo_resultado_general AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_resultado_general%ROWTYPE;

	BEGIN

	  SELECT 	res_id, res_des, res_tpo, res_dir  
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Resultado_General AS T1
		WHERE 	cve = T1.res_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Resultado General ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Resultado_General(smallint) IS 'Funcion que devuelve los resultados generales de lps procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Resultado_General(smallint) OWNER TO "UNI";
 
-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE RESULTADOS O PRODUCTOS DETALLADO ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Resultado_General_Det(smallint)
  RETURNS SETOF "UNI_KAT".tpo_resultado_general_det AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_resultado_general_det%ROWTYPE;

	BEGIN

	  SELECT 	res_det_id, res_gen_id, res_det_cve, res_det_des, res_det_tpo, res_det_dir   
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Resultado_General_Det AS T1
		WHERE 	cve = T1.res_det_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Insumo General Detallado ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Resultado_General_Det(smallint) IS 'Funcion que devuelve los insumos generales detallados de los procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Resultado_General_Det(smallint) OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE LOS TRAMITES O SERVICIOS  ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Tramite(smallint)
  RETURNS SETOF "UNI_KAT".tpo_tramite AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_tramite%ROWTYPE;

	BEGIN

	  SELECT 	tra_id, dep_id, tpo_tra_cve, tra_tra_id, tra_ver, tra_nom, tra_cod, tra_des, tra_pag, tra_fun, tra_obs, tra_flu,tra_tar, tra_dur, tra_pre, tra_neg, tra_vig, tra_ini, tra_fin, tra_est, tra_per, tra_are
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Tramite AS T1
		WHERE 	cve = T1.tra_id
		LIMIT 1;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Tramite ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Tramite(smallint) IS 'Funcion que devuelve los insumos generales detallados de los procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Tramite(smallint) OWNER TO "UNI";
 
-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE LOS REQUERIMIENTOS DETALLADOS  ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Tramite_Requerimiento_Det(smallint)
  RETURNS SETOF "UNI_KAT".tpo_requerimiento AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_requerimiento%ROWTYPE;

	BEGIN

	  SELECT 	req_det_id, req_gen_id, req_det_cve, req_det_des, req_det_tpo, req_det_imp
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Tramite_requerimiento_Det AS T1
		WHERE 	cve = T1.req_det_id;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Requerimiento ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Tramite_Requerimiento_Det(smallint) IS 'Funcion que devuelve los insumos generales detallados de los procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Tramite_Requerimiento_Det(smallint) OWNER TO "UNI";

-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE LOS TRAMITES O SERVICIOS DETALLADOS POR TAREAS   ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Tramite_Detalle(smallint)
  RETURNS SETOF "UNI_KAT".tpo_tramite_det AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_tramite_det%ROWTYPE;

	BEGIN

	  SELECT 	tra_det_con, tra_pro_con, tra_det_cve, tra_det_id, tra_det_ord, tra_det_ant, tra_det_pos, tra_det_ele_cve, tra_det_des, tra_det_per, tra_det_are, tra_det_res, tra_det_req
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Tramite_Det AS T1
		WHERE 	cve = T1.tra_det_con;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Requerimiento ( % ) no encontrado',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Tramite_Detalle(smallint) IS 'Funcion que devuelve los insumos generales detallados de los procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Tramite_Detalle(smallint) OWNER TO "UNI";
 
-- ---------------------------------------------------------------------------------------------------------------------------------
-- FUNCION DE LOS VARIANTES DE LOS TRAMITES    ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION "UNI_KAT".FN_Get_Tramite_Variante(smallint)
  RETURNS SETOF "UNI_KAT".tpo_variante AS $BODY$
  
	DECLARE
		cve 		ALIAS FOR $1;
		_v_type		"UNI_KAT".tpo_variante%ROWTYPE;

	BEGIN

	  SELECT 	var_id, pro_pro_con, var_pro_cve, var_pro_nom, var_pro_des
		INTO 	_v_type
		FROM 	"UNI_KAT".VW_Qry_Tramite_Variante AS T1
		WHERE 	cve = T1.var_id;
		
		IF NOT FOUND THEN
			RAISE EXCEPTION 'Variante del tramite ( % ) no encontrada',  cve
			USING HINT = 'Revise la clave introducida';
		END IF;

		RETURN NEXT _v_type;
		
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

COMMENT ON 	FUNCTION "UNI_KAT".FN_Get_Tramite_Variante(smallint) IS 'Funcion que devuelve las variantes de los procesos';

ALTER 		FUNCTION "UNI_KAT".FN_Get_Tramite_Variante(smallint) OWNER TO "UNI";
 






-- GEOESCRITORIO VIRTUAL V 4.0 BETA
-- CAPA I BASE DE DATOS DE DESARROLLO
-- PERMISOS EN EL ESQUEMA DEV_FTG_KAT
-- AUTOR. GONZALO TRINIDAD GARRIDO
-- 11/2018
-- VERSION FINAL



-- ---------------------------------------------------------------------------------------------------------------------------------
-- CONTENIDO -----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION ESQUEMA DE ADMINISTRACION "FTG_KAT" -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------
  
-- PERMISOS PARA PROPIETARIO UNI_KAT EN SECUENCIAS
-- PERMISOS PARA PROPIETARIO UNI_KAT EN TABLAS
-- PERMISOS PARA USUARIO  "IDE", "KTT", "TSR", "SBI", "UNI", "URB"  EN SECUENCIAS
-- PERMISOS PARA USUARIO  "IDE", "KTT", "TSR", "SBI", "UNI", "URB"  EN TABLAS


-- ---------------------------------------------------------------------------------------------------------------------------------
-- SECCION PERMISOS DE USO ---------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------------------------------------------------
-- PERMISOS PARA PROPIETARIO UNI EN SECUENCIAS ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


GRANT ALL ON SEQUENCE "UNI_KAT".estatus_tramites_est_tra_cve_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".insumos_generales_detalle_ins_det_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".insumos_generales_ins_gen_cve_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".res_vistas_secciones_vta_sec_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".resultados_generales_detalle_res_det_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".resultados_generales_res_gen_cve_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".secciones_sec_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".situacion_tareas_sit_tar_cve_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".tipos_elementos_tpo_ele_cve_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".tipos_tramites_tpo_tra_cve_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".tramites_detalle_pro_tar_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".tramites_pro_pro_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".tramites_requerimientos_detalle_req_det_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".tramites_variantes_var_pro_con_seq TO "UNI";
GRANT ALL ON SEQUENCE "UNI_KAT".vistas_vta_con_seq TO "UNI";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- PERMISOS PARA PROPIETARIO UNI EN TABLAS (SIN DELETE) ----------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------


GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general_det(smallint) 								TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general_det(smallint) 								TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_elemento(smallint) 										TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_tramite(smallint) 										TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite(smallint) 											TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_detalle(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_requerimiento_det(smallint) 							TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_variante(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general_det(smallint) 								TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general_det(smallint) 								TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_elemento(smallint) 										TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_tramite(smallint) 										TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite(smallint) 											TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_detalle(smallint) 									TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_requerimiento_det(smallint) 							TO "UNI";
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_variante(smallint) 									TO "UNI";


GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".estatus_tramites TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".insumos_generales TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".insumos_generales_detalle 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".res_vistas_secciones 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".resultados_generales 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".resultados_generales_detalle 		TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".secciones 							TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".situacion_tareas 					TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".tipos_elementos 					TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".tipos_tramites 					TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".tramites 							TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".tramites_detalle 					TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".tramites_requerimientos_detalle 	TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".tramites_variantes 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vistas 							TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_estatus_tramite 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_insumo_general 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_insumo_general_det 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_res_vista_seccion 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_resultado_general 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_resultado_general_det 		TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_seccion 					TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_situacion_tarea 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_tipo_elemento 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_tipo_tramite 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_tramite 					TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_tramite_det 				TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_tramite_requerimiento_det 	TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_tramite_variante 			TO "UNI";
GRANT INSERT, SELECT, UPDATE, REFERENCES, TRIGGER ON TABLE "UNI_KAT".vw_qry_vista 						TO "UNI";


-- ---------------------------------------------------------------------------------------------------------------------------------
-- PERMISOS PARA USUARIO  "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP"  EN SECUENCIAS -------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

GRANT SELECT ON SEQUENCE "UNI_KAT".estatus_tramites_est_tra_cve_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".insumos_generales_detalle_ins_det_con_seq 		TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".insumos_generales_ins_gen_cve_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".res_vistas_secciones_vta_sec_con_seq 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".resultados_generales_detalle_res_det_con_seq 	TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".resultados_generales_res_gen_cve_seq 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".secciones_sec_con_seq 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".situacion_tareas_sit_tar_cve_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".tipos_elementos_tpo_ele_cve_seq 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".tipos_tramites_tpo_tra_cve_seq 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".tramites_detalle_pro_tar_con_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".tramites_pro_pro_con_seq 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".tramites_requerimientos_detalle_req_det_con_seq 	TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".tramites_variantes_var_pro_con_seq 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON SEQUENCE "UNI_KAT".vistas_vta_con_seq 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;


------------------------------------------------------------------------------------------------------------------------------------
-- PERMISOS PARA USUARIO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP"  EN TABLAS ------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------

GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general_det(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general_det(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_elemento(smallint) 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_tramite(smallint) 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite(smallint) 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_detalle(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_requerimiento_det(smallint) 		TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_variante(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_insumo_general_det(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_resultado_general_det(smallint) 			TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_elemento(smallint) 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tpo_tramite(smallint) 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite(smallint) 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_detalle(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_requerimiento_det(smallint) 		TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT EXECUTE ON FUNCTION "UNI_KAT".fn_get_tramite_variante(smallint) 				TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;



GRANT SELECT ON TABLE "UNI_KAT".estatus_tramites 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".insumos_generales 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".insumos_generales_detalle 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".res_vistas_secciones 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".resultados_generales 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".resultados_generales_detalle 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".secciones 											TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".situacion_tareas 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".tipos_elementos 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".tipos_tramites 										TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".tramites 											TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".tramites_detalle 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".tramites_requerimientos_detalle 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".tramites_variantes 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vistas 												TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_estatus_tramite 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_insumo_general 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_insumo_general_det 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_res_vista_seccion 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_resultado_general 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_resultado_general_det 						TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_seccion 										TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_situacion_tarea 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_tipo_elemenTO 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_tipo_tramite 								TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_tramite 										TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_tramite_det 									TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_tramite_requerimiento_det 					TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_tramite_variante 							TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;
GRANT SELECT ON TABLE "UNI_KAT".vw_qry_vista 										TO "IDE", "KTT", "TSR", "SBI", "UNI", "URB", "RPP" ;


