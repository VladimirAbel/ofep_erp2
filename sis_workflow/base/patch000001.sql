/***********************************I-SCP-FRH-WF-0-15/02/2013****************************************/


CREATE TABLE wf.ttipo_proceso (
  id_tipo_proceso   SERIAL NOT NULL, 
  id_tipo_estado   int4, 
  id_proceso_macro int4 NOT NULL, 
  nombre           varchar(200), 
  tabla            varchar(100), 
  columna_llave    varchar(150), 
  codigo           varchar(5), 
  PRIMARY KEY (id_tipo_proceso)) INHERITS (pxp.tbase);
  
  
CREATE TABLE wf.ttipo_estado (
  id_tipo_estado   SERIAL NOT NULL, 
  id_tipo_proceso int4, 
  inicio          varchar(2), 
  disparador      varchar(2), 
  nombre_estado   varchar(150), 
  PRIMARY KEY (id_tipo_estado)) INHERITS (pxp.tbase);
  
  
CREATE TABLE wf.testructura_estado (
  id_estructura_empresa  SERIAL NOT NULL, 
  id_tipo_estado_padre  int4 NOT NULL, 
  id_tipo_estado_hijo   int4 NOT NULL, 
  prioridad             int4, 
  regla                 varchar(1000), 
  PRIMARY KEY (id_estructura_empresa)) INHERITS (pxp.tbase);
  
  
CREATE TABLE wf.testado (
  id_estado           SERIAL NOT NULL, 
  id_estado_anterior int4 NOT NULL, 
  id_tipo_estado     int4 NOT NULL, 
  id_proceso         int4 NOT NULL, 
  id_funcionario     int4 NOT NULL, 
  fecha              timestamp, 
  PRIMARY KEY (id_estado)) INHERITS (pxp.tbase);
  
  
CREATE TABLE wf.tnum_tramite (
  id_num_tramite    SERIAL NOT NULL, 
  id_proceso_macro int4 NOT NULL, 
  id_gestion       int8, 
  num_siguiente    int8, 
  PRIMARY KEY (id_num_tramite)) INHERITS (pxp.tbase);
     
  
CREATE TABLE wf.tcolumna (
  id_columna       SERIAL NOT NULL, 
  id_tipo_proceso int4 NOT NULL, 
  nombre          varchar(150), 
  tipo_dato       varchar(100), 
  orden           int4, 
  PRIMARY KEY (id_columna)) INHERITS (pxp.tbase);
  
  
CREATE TABLE wf.tcolumna_valor (
  id_columna_valor  SERIAL NOT NULL, 
  id_columna       int4 NOT NULL, 
  id_proceso       int4 NOT NULL, 
  valor            varchar(300), 
  PRIMARY KEY (id_columna_valor)) INHERITS (pxp.tbase);
    
  
CREATE TABLE wf.tproceso (
  id_proceso       SERIAL NOT NULL, 
  id_tipo_proceso int4 NOT NULL, 
  nro_tramite     int4, 
  tabla           varchar(100), 
  columna_llave   varchar(100), 
  valor_cl        int8, 
  PRIMARY KEY (id_proceso)) INHERITS (pxp.tbase);
  
  
CREATE TABLE wf.proceso_macro (
  id_proceso_macro  SERIAL NOT NULL, 
  id_subsistema    int4, 
  codigo           varchar(10), 
  nombre           varchar(200), 
  inicio           varchar(2), 
  PRIMARY KEY (id_proceso_macro)) INHERITS (pxp.tbase);
  
/*****************************F-SCP-FRH-WF-0-15/02/2013*************/

