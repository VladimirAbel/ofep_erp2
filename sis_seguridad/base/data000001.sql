/********************************************I-DAT-RCM-SEGU-0-15/01/2013********************************************/
/*
*	Author: RAC
*	Date: 21/12/2012
*	Description: Build the menu definition and the composition
*/


/*

Para  definir la la metadata, menus, roles, etc

1) sincronize ls funciones y procedimientos del sistema
2)  verifique que la primera linea de los datos sea la insercion del sistema correspondiente
3)  exporte los datos a archivo SQL (desde la interface de sistema en sis_seguridad), 
    verifique que la codificacion  se mantenga en UTF8 para no distorcionar los caracteres especiales
4)  remplaze los sectores correspondientes en este archivo en su totalidad:  (el orden es importante)  
                             menu, 
                             funciones, 
                             procedimietnos

*/




INSERT INTO segu.tsubsistema (id_subsistema, codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES (0, 'PXP', 'FRAMEWORK', '2011-11-23', 'PXP', 'activo', 'FRAMEWORK', NULL);

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('SEGU', 'Sistema de Seguridad', '2009-11-02', 'SG', 'activo', 'seguridad', NULL);




INSERT INTO segu.tgui ("id_gui", "nombre", "descripcion", "fecha_reg", "codigo_gui", "visible", "orden_logico", "ruta_archivo", "nivel", "icono", "id_subsistema", "clase_vista", "estado_reg", "modificado")
VALUES (0, E'SISTEMA', E'NODO RAIZ', E'2009-09-08', E'SISTEMA', E'si', 1, NULL, 0, NULL, 0, E'NODO RAIZ', E'activo', 1);




select pxp.f_insert_tgui ('<i class="fa fa-users fa-2x"></i> SEGURIDAD', 'Seguridad', 'SEGU', 'si', 1, '', 1, '', 'Seguridad', 'SEGU');
select pxp.f_insert_tgui ('Personas', 'Personas', 'Personas', 'si', 1, 'sis_seguridad/vista/reportes/persona.js', 3, '', 'repPersona', 'SEGU');
select pxp.f_insert_tgui ('Persona', 'persona', 'per', 'si', 7, 'sis_seguridad/vista/persona/Persona.php', 3, '', 'persona', 'SEGU');
select pxp.f_insert_tgui ('Usuario', 'usuario', 'USUARI', 'si', 2, 'sis_seguridad/vista/usuario/Usuario.php', 3, '', 'usuario', 'SEGU');
select pxp.f_insert_tgui ('Rol', 'rol', 'RROOLL', 'si', 3, 'sis_seguridad/vista/rol/Rol.php', 3, '', 'rol', 'SEGU');
select pxp.f_insert_tgui ('Clasificador', 'clasificador', 'CLASIF', 'si', 3, 'sis_seguridad/vista/clasificador/Clasificador.php', 3, '', 'clasificador', 'SEGU');
select pxp.f_insert_tgui ('Sistema', 'subsistema', 'SISTEM', 'si', 5, 'sis_seguridad/vista/subsistema/Subsistema.php', 3, '', 'Subsistema', 'SEGU');
select pxp.f_insert_tgui ('Libreta', 'Libreta', 'LIB', 'si', 100, 'sis_seguridad/vista/libreta_her/LibretaHer.php', 3, '', 'LibretaHer', 'SEGU');
select pxp.f_insert_tgui ('Procesos', '', 'PROCSEGU', 'si', 2, '', 2, '', '', 'SEGU');
select pxp.f_insert_tgui ('Parametros', '', 'o', 'si', 1, '', 2, '', '', 'SEGU');
select pxp.f_insert_tgui ('Reportes', 'Reportes', 'RepSeg', 'si', 3, '', 2, '', '', 'SEGU');
select pxp.f_insert_tgui ('Tipo Documento', 'tipo_documento', 'TIPDOC', 'si', 7, 'sis_seguridad/vista/tipo_documento/TipoDocumento.php', 3, '', 'tipo_documento', 'SEGU');
select pxp.f_insert_tgui ('Patrones de Eventos', 'Patrones de Eventos', 'PATROEVE', 'si', 8, 'sis_seguridad/vista/patron_evento/PatronEvento.php', 4, '', 'patron_evento', 'SEGU');
select pxp.f_insert_tgui ('Horarios de Trabajo', 'Horarios de Trabajo', 'HORTRA', 'si', 9, 'sis_seguridad/vista/horario_trabajo/HorarioTrabajo.php', 3, '', 'horario_trabajo', 'SEGU');
select pxp.f_insert_tgui ('Monitoreo y Análisis de Bitácoras', 'Herramienta para hacer seguimiento a eventos del sistema', 'MONANA', 'si', 6, '', 3, '', '', 'SEGU');
select pxp.f_insert_tgui ('Monitoreo', 'Monitoreo', 'MONITOR', 'si', 1, '', 4, '', '', 'SEGU');
select pxp.f_insert_tgui ('Análisis de Bitácoras', 'Análisis de Bitácoras', 'ANABIT', 'si', 2, '', 4, '', '', 'SEGU');
select pxp.f_insert_tgui ('Bloqueos', 'Bloqueos', 'BLOMON', 'si', 3, 'sis_seguridad/vista/bloqueo/Bloqueo.php', 4, '', 'bloqueo', 'SEGU');
select pxp.f_insert_tgui ('Notificaciones', 'Notificaciones', 'NOTMON', 'si', 4, 'sis_seguridad/vista/notificacion/Notificacion.php', 4, '', 'notificacion', 'SEGU');
select pxp.f_insert_tgui ('Monitor de Sistema', 'Monitor de Sistema', 'MONSIS', 'si', 1, 'sis_seguridad/vista/monitor_sistema/MonitorSistema.php', 5, '', 'monitor_sistema', 'SEGU');
select pxp.f_insert_tgui ('Monitor de Uso de Recursos', 'Monitor de Uso de Recursos', 'MONUSREC', 'si', 2, 'sis_seguridad/vista/monitor_recursos/MonitorRecursos.php', 4, '', 'monitor_recursos', 'SEGU');
select pxp.f_insert_tgui ('Monitor de Actividades en BD', 'Monitor de Actividades en BD', 'MONBD', 'si', 3, 'sis_seguridad/vista/monitor_bd/MonitorBD.php', 5, '', 'monitor_bd', 'SEGU');
select pxp.f_insert_tgui ('Monitor de Objetos de BD', 'Monitor de Objetos de BD', 'MONOJBD', 'si', 4, 'sis_seguridad/vista/monitor_objetos/MonitorObjetos.php', 5, '', 'monitor_objetos', 'SEGU');
select pxp.f_insert_tgui ('Bitácoras de Sistema', 'Bitácoras de Sistema', 'BITSIS', 'si', 1, 'sis_seguridad/vista/bitacora_sistema/BitacoraSistema.php', 5, '', 'bitacora_sistema', 'SEGU');
select pxp.f_insert_tgui ('Bitácoras de BD', 'Bitácoras de BD', 'BITBD', 'si', 2, 'sis_seguridad/vista/bitacora_bd/BitacoraBD.php', 5, '', 'bitacora_bd', 'SEGU');
select pxp.f_insert_tgui ('Trabajo Fuera de Horario', 'Trabajo Fuera de Horario', 'TRAHOR', 'si', 3, 'sis_seguridad/vista/fuera_horario/FueraHorario.php', 5, '', 'fuera_horario', 'SEGU');
select pxp.f_insert_tgui ('Tablas migradas ENDESIS', 'Listado de las tablas que se migran de ENDESIS', 'TBLMIG', 'si', 3, 'sis_seguridad/vista/tabla_migrar/TablaMigrar.php', 3, '', 'TablaMigrar', 'SEGU');
----------------------------------
--COPY LINES TO dependencies.sql FILE  
---------------------------------

select pxp.f_insert_testructura_gui ('SEGU', 'SISTEMA');
select pxp.f_insert_testructura_gui ('PROCSEGU', 'SEGU');
select pxp.f_insert_testructura_gui ('o', 'SEGU');
select pxp.f_insert_testructura_gui ('RepSeg', 'SEGU');
select pxp.f_insert_testructura_gui ('MONANA', 'PROCSEGU');
select pxp.f_insert_testructura_gui ('RROOLL', 'PROCSEGU');
select pxp.f_insert_testructura_gui ('USUARI', 'PROCSEGU');
select pxp.f_insert_testructura_gui ('SISTEM', 'PROCSEGU');
select pxp.f_insert_testructura_gui ('HORTRA', 'o');
select pxp.f_insert_testructura_gui ('PATROEVE', 'o');
select pxp.f_insert_testructura_gui ('CLASIF', 'o');
select pxp.f_insert_testructura_gui ('per', 'o');
select pxp.f_insert_testructura_gui ('TIPDOC', 'o');
select pxp.f_insert_testructura_gui ('Personas', 'RepSeg');
select pxp.f_insert_testructura_gui ('NOTMON', 'MONANA');
select pxp.f_insert_testructura_gui ('BLOMON', 'MONANA');
select pxp.f_insert_testructura_gui ('ANABIT', 'MONANA');
select pxp.f_insert_testructura_gui ('MONITOR', 'MONANA');
select pxp.f_insert_testructura_gui ('MONOJBD', 'MONITOR');
select pxp.f_insert_testructura_gui ('MONBD', 'MONITOR');
select pxp.f_insert_testructura_gui ('MONUSREC', 'MONITOR');
select pxp.f_insert_testructura_gui ('MONSIS', 'MONITOR');
select pxp.f_insert_testructura_gui ('TRAHOR', 'ANABIT');
select pxp.f_insert_testructura_gui ('BITBD', 'ANABIT');
select pxp.f_insert_testructura_gui ('BITSIS', 'ANABIT');
select pxp.f_insert_testructura_gui ('TBLMIG', 'o');





---------------------------
-- Data for table segu.tclasificador (OID = 307111) (LIMIT 0,4)
------------------------------------
INSERT INTO segu.tclasificador ( codigo, descripcion, prioridad, fecha_reg, estado_reg)
VALUES ('ASE', 'ALTO SECRETO', 1, '2009-01-01', 'activo');

INSERT INTO segu.tclasificador (codigo, descripcion, prioridad, fecha_reg, estado_reg)
VALUES ('SEC', 'SECRETO', 2, '2009-11-02', 'activo');

INSERT INTO segu.tclasificador (codigo, descripcion, prioridad, fecha_reg, estado_reg)
VALUES ('PRI', 'PRIVADA', 4, '2010-08-25', 'activo');

INSERT INTO segu.tclasificador (codigo, descripcion, prioridad, fecha_reg, estado_reg)
VALUES ('PUB', 'PUBLICO', 3, '2010-09-10', 'activo');


------------------------------------------------
-- DDEF DE USUARIO INICIAL ADMINISTRADOR
------------------------------------------------------


INSERT INTO segu.tpersona (id_usuario_reg, id_usuario_mod, fecha_reg, fecha_mod, estado_reg, nombre, apellido_paterno, apellido_materno, ci, correo, celular1, num_documento, telefono1, telefono2, celular2, foto, extension, genero, fecha_nacimiento, direccion)
VALUES (NULL, NULL, NULL, NULL, NULL, 'ADMINISTRADOR', 'DEL SISTEMA', '', '', '', NULL, NULL, NULL, NULL, NULL, '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', 'png', NULL, NULL, NULL);

--
-- Data for table segu.tusuario (OID = 305814) (LIMIT 0,1)
--
INSERT INTO segu.tusuario ( id_clasificador, cuenta, contrasena, fecha_caducidad, fecha_reg, estilo, contrasena_anterior, id_persona, estado_reg, autentificacion)
VALUES (1, 'admin', 'admin', '2020-01-31', '2011-05-10', 'xtheme-gray.css', 'f1290186a5d0b1ceab27f4e77c0c5d68', 1, 'activo', 'local');

--
-- Data for table segu.trol (OID = 307211) (LIMIT 0,1)
--
INSERT INTO segu.trol (descripcion, fecha_reg, estado_reg, rol, id_subsistema)
VALUES ('Administrador', '2011-05-17', 'activo', 'Administrador', NULL);

--
-- Data for table segu.tusuario_rol (OID = 307268) (LIMIT 0,1)
--
INSERT INTO segu.tusuario_rol (id_rol, id_usuario, fecha_reg, estado_reg)
VALUES (1, 1, '2011-05-17', 'activo');


-------------------------------------
--  DEF DE NUMEROS PRIMOS PARA RSA
-------------------------------


INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1, 961772029);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (2, 961772047);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (3, 961772057);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (4, 961772087);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (5, 961772111);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (6, 961772131);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (7, 961772159);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (8, 961772167);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (9, 961772171);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (10, 961772173);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (11, 961772183);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (12, 961772213);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (13, 961772249);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (14, 961772261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (15, 961772281);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (16, 961772309);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (17, 961772323);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (18, 961772341);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (19, 961772351);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (20, 961772401);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (21, 961772417);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (22, 961772429);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (23, 961772431);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (24, 961772459);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (25, 961772479);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (26, 961772519);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (27, 961772521);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (28, 961772563);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (29, 961772573);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (30, 961772593);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (31, 961772639);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (32, 961772653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (33, 961772659);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (34, 961772677);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (35, 961772681);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (36, 961772689);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (37, 961772699);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (38, 961772717);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (39, 961772729);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (40, 961772741);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (41, 961772753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (42, 961772759);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (43, 961772839);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (44, 961772863);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (45, 961772869);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (46, 961772879);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (47, 961772897);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (48, 961772921);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (49, 961772963);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (50, 961773013);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (51, 961773067);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (52, 961773073);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (53, 961773091);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (54, 961773119);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (55, 961773151);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (56, 961773157);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (57, 961773167);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (58, 961773199);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (59, 961773223);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (60, 961773247);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (61, 961773251);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (62, 961773271);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (63, 961773277);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (64, 961773287);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (65, 961773289);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (66, 961773299);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (67, 961773347);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (68, 961773353);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (69, 961773377);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (70, 961773383);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (71, 961773403);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (72, 961773443);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (73, 961773473);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (74, 961773479);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (75, 961773493);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (76, 961773499);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (77, 961773529);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (78, 961773551);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (79, 961773569);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (80, 961773581);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (81, 961773583);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (82, 961773587);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (83, 961773601);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (84, 961773607);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (85, 961773731);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (86, 961773751);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (87, 961773781);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (88, 961773889);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (89, 961773899);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (90, 961773913);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (91, 961773937);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (92, 961773949);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (93, 961774013);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (94, 961774027);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (95, 961774043);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (96, 961774057);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (97, 961774061);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (98, 961774063);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (99, 961774069);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (100, 961774127);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (101, 961774153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (102, 961774157);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (103, 961774211);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (104, 961774223);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (105, 961774267);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (106, 961774273);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (107, 961774313);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (108, 961774381);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (109, 961774397);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (110, 961774403);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (111, 961774409);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (112, 961774447);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (113, 961774459);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (114, 961774487);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (115, 961774493);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (116, 961774523);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (117, 961774537);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (118, 961774553);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (119, 961774571);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (120, 961774577);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (121, 961774603);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (122, 961774607);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (123, 961774657);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (124, 961774669);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (125, 961774687);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (126, 961774703);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (127, 961774717);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (128, 961774741);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (129, 961774769);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (130, 961774787);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (131, 961774829);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (132, 961774859);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (133, 961774873);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (134, 961774901);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (135, 961774939);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (136, 961774951);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (137, 961774967);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (138, 961774981);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (139, 961775011);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (140, 961775063);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (141, 961775081);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (142, 961775099);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (143, 961775123);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (144, 961775179);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (145, 961775197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (146, 961775203);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (147, 961775239);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (148, 961775251);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (149, 961775257);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (150, 961775263);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (151, 961775267);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (152, 961775293);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (153, 961775317);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (154, 961775359);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (155, 961775369);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (156, 961775377);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (157, 961775387);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (158, 961775393);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (159, 961775411);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (160, 961775449);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (161, 961775489);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (162, 961775501);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (163, 961775509);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (164, 961775569);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (165, 961775587);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (166, 961775597);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (167, 961775603);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (168, 961775623);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (169, 961775627);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (170, 961775641);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (171, 961775653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (172, 961775671);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (173, 961775677);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (174, 961775693);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (175, 961775701);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (176, 961775707);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (177, 961775747);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (178, 961775753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (179, 961775791);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (180, 961775849);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (181, 961775851);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (182, 961775887);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (183, 961775917);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (184, 961775921);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (185, 961775977);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (186, 961775987);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (187, 961776061);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (188, 961776091);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (189, 961776131);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (190, 961776133);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (191, 961776157);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (192, 961776161);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (193, 961776163);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (194, 961776197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (195, 961776217);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (196, 961776251);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (197, 961776253);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (198, 961776269);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (199, 961776281);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (200, 961776289);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (201, 961776307);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (202, 961776311);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (203, 961776317);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (204, 961776331);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (205, 961776367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (206, 961776379);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (207, 961776383);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (208, 961776419);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (209, 961776421);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (210, 961776443);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (211, 961776449);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (212, 961776469);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (213, 961776481);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (214, 961776521);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (215, 961776559);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (216, 961776587);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (217, 961776593);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (218, 961776617);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (219, 961776659);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (220, 961776667);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (221, 961776689);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (222, 961776703);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (223, 961776709);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (224, 961776727);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (225, 961776749);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (226, 961776791);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (227, 961776799);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (228, 961776847);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (229, 961776857);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (230, 961776919);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (231, 961776943);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (232, 961777021);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (233, 961777043);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (234, 961777067);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (235, 961777079);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (236, 961777109);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (237, 961777111);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (238, 961777123);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (239, 961777129);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (240, 961777151);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (241, 961777153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (242, 961777181);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (243, 961777211);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (244, 961777217);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (245, 961777237);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (246, 961777277);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (247, 961777291);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (248, 961777339);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (249, 961777351);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (250, 961777367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (251, 961777381);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (252, 961777391);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (253, 961777417);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (254, 961777441);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (255, 961777451);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (256, 961777459);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (257, 961777493);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (258, 961777507);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (259, 961777529);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (260, 961777541);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (261, 961777589);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (262, 961777711);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (263, 961777717);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (264, 961777723);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (265, 961777753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (266, 961777783);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (267, 961777807);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (268, 961777811);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (269, 961777813);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (270, 961777823);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (271, 961777829);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (272, 961777841);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (273, 961777871);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (274, 961777897);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (275, 961777903);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (276, 961777937);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (277, 961777969);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (278, 961777981);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (279, 961778023);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (280, 961778087);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (281, 961778093);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (282, 961778101);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (283, 961778137);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (284, 961778159);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (285, 961778161);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (286, 961778171);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (287, 961778173);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (288, 961778267);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (289, 961778269);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (290, 961778273);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (291, 961778357);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (292, 961778387);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (293, 961778429);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (294, 961778453);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (295, 961778471);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (296, 961778473);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (297, 961778483);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (298, 961778509);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (299, 961778527);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (300, 961778563);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (301, 961778581);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (302, 961778593);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (303, 961778599);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (304, 961778659);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (305, 961778681);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (306, 961778693);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (307, 961778717);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (308, 961778743);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (309, 961778749);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (310, 961778761);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (311, 961778773);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (312, 961778789);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (313, 961778801);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (314, 961778827);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (315, 961778837);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (316, 961778843);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (317, 961778891);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (318, 961778897);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (319, 961778899);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (320, 961778911);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (321, 961778921);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (322, 961778929);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (323, 961778941);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (324, 961778957);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (325, 961778977);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (326, 961778989);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (327, 961779011);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (328, 961779043);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (329, 961779197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (330, 961779241);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (331, 961779257);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (332, 961779263);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (333, 961779361);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (334, 961779367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (335, 961779383);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (336, 961779397);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (337, 961779421);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (338, 961779463);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (339, 961779493);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (340, 961779547);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (341, 961779571);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (342, 961779587);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (343, 961779613);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (344, 961779647);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (345, 961779649);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (346, 961779683);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (347, 961779719);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (348, 961779727);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (349, 961779757);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (350, 961779769);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (351, 961779787);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (352, 961779823);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (353, 961779857);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (354, 961779859);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (355, 961779883);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (356, 961779893);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (357, 961779901);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (358, 961779911);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (359, 961779977);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (360, 961779997);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (361, 961780007);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (362, 961780031);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (363, 961780069);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (364, 961780073);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (365, 961780081);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (366, 961780087);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (367, 961780153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (368, 961780187);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (369, 961780189);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (370, 961780199);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (371, 961780231);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (372, 961780289);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (373, 961780291);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (374, 961780297);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (375, 961780349);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (376, 961780367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (377, 961780373);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (378, 961780387);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (379, 961780433);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (380, 961780439);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (381, 961780483);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (382, 961780507);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (383, 961780517);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (384, 961780529);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (385, 961780541);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (386, 961780577);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (387, 961780591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (388, 961780607);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (389, 961780619);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (390, 961780637);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (391, 961780639);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (392, 961780643);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (393, 961780649);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (394, 961780663);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (395, 961780669);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (396, 961780709);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (397, 961780711);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (398, 961780723);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (399, 961780733);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (400, 961780739);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (401, 961780769);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (402, 961780777);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (403, 961780789);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (404, 961780823);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (405, 961780837);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (406, 961780847);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (407, 961780867);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (408, 961780879);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (409, 961780907);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (410, 961780951);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (411, 961780987);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (412, 961780991);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (413, 961781003);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (414, 961781017);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (415, 961781021);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (416, 961781039);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (417, 961781053);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (418, 961781063);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (419, 961781077);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (420, 961781131);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (421, 961781147);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (422, 961781153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (423, 961781167);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (424, 961781173);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (425, 961781189);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (426, 961781203);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (427, 961781207);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (428, 961781213);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (429, 961781251);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (430, 961781263);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (431, 961781279);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (432, 961781281);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (433, 961781291);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (434, 961781297);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (435, 961781299);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (436, 961781323);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (437, 961781347);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (438, 961781371);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (439, 961781389);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (440, 961781393);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (441, 961781411);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (442, 961781413);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (443, 961781419);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (444, 961781453);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (445, 961781503);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (446, 961781537);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (447, 961781609);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (448, 961781621);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (449, 961781627);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (450, 961781641);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (451, 961781659);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (452, 961781669);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (453, 961781671);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (454, 961781683);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (455, 961781687);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (456, 961781719);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (457, 961781741);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (458, 961781771);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (459, 961781819);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (460, 961781861);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (461, 961781879);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (462, 961781911);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (463, 961781921);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (464, 961781923);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (465, 961781939);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (466, 961781941);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (467, 961781963);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (468, 961781983);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (469, 961782023);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (470, 961782047);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (471, 961782061);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (472, 961782067);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (473, 961782079);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (474, 961782097);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (475, 961782139);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (476, 961782167);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (477, 961782193);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (478, 961782209);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (479, 961782229);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (480, 961782271);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (481, 961782277);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (482, 961782287);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (483, 961782301);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (484, 961782317);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (485, 961782359);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (486, 961782377);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (487, 961782383);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (488, 961782389);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (489, 961782391);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (490, 961782431);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (491, 961782433);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (492, 961782439);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (493, 961782443);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (494, 961782449);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (495, 961782473);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (496, 961782509);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (497, 961782517);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (498, 961782529);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (499, 961782539);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (500, 961782583);

--
-- Data for table segu.segu.tprimo (OID = 307189) (LIMIT 500,500)
--
INSERT INTO segu.tprimo (id_primo, numero)
VALUES (501, 961782589);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (502, 961782611);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (503, 961782629);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (504, 961782637);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (505, 961782643);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (506, 961782649);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (507, 961782671);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (508, 961782733);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (509, 961782737);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (510, 961782751);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (511, 961782817);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (512, 961782821);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (513, 961782823);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (514, 961782853);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (515, 961782859);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (516, 961782863);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (517, 961782937);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (518, 961783003);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (519, 961783049);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (520, 961783087);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (521, 961783127);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (522, 961783129);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (523, 961783133);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (524, 961783159);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (525, 961783169);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (526, 961783171);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (527, 961783181);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (528, 961783189);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (529, 961783201);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (530, 961783213);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (531, 961783219);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (532, 961783237);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (533, 961783261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (534, 961783271);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (535, 961783297);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (536, 961783327);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (537, 961783343);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (538, 961783349);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (539, 961783351);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (540, 961783357);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (541, 961783369);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (542, 961783379);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (543, 961783393);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (544, 961783411);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (545, 961783441);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (546, 961783469);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (547, 961783507);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (548, 961783519);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (549, 961783531);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (550, 961783549);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (551, 961783631);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (552, 961783643);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (553, 961783723);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (554, 961783729);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (555, 961783777);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (556, 961783783);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (557, 961783807);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (558, 961783817);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (559, 961783843);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (560, 961783871);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (561, 961783873);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (562, 961783903);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (563, 961783931);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (564, 961783969);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (565, 961783973);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (566, 961783981);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (567, 961783987);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (568, 961784017);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (569, 961784051);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (570, 961784071);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (571, 961784137);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (572, 961784143);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (573, 961784167);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (574, 961784177);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (575, 961784203);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (576, 961784227);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (577, 961784267);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (578, 961784279);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (579, 961784287);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (580, 961784293);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (581, 961784309);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (582, 961784323);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (583, 961784339);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (584, 961784347);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (585, 961784371);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (586, 961784407);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (587, 961784419);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (588, 961784431);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (589, 961784441);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (590, 961784459);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (591, 961784479);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (592, 961784497);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (593, 961784521);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (594, 961784543);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (595, 961784557);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (596, 961784573);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (597, 961784581);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (598, 961784591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (599, 961784599);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (600, 961784627);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (601, 961784633);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (602, 961784647);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (603, 961784653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (604, 961784671);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (605, 961784687);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (606, 961784729);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (607, 961784737);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (608, 961784753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (609, 961784773);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (610, 961784777);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (611, 961784833);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (612, 961784849);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (613, 961784861);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (614, 961784869);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (615, 961784881);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (616, 961784899);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (617, 961784903);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (618, 961784909);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (619, 961784927);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (620, 961784953);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (621, 961785007);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (622, 961785049);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (623, 961785061);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (624, 961785103);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (625, 961785119);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (626, 961785151);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (627, 961785169);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (628, 961785173);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (629, 961785191);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (630, 961785197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (631, 961785221);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (632, 961785239);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (633, 961785269);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (634, 961785281);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (635, 961785317);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (636, 961785359);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (637, 961785367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (638, 961785379);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (639, 961785427);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (640, 961785431);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (641, 961785463);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (642, 961785467);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (643, 961785481);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (644, 961785497);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (645, 961785499);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (646, 961785527);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (647, 961785547);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (648, 961785563);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (649, 961785569);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (650, 961785577);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (651, 961785637);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (652, 961785653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (653, 961785661);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (654, 961785691);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (655, 961785701);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (656, 961785703);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (657, 961785763);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (658, 961785767);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (659, 961785787);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (660, 961785793);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (661, 961785817);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (662, 961785889);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (663, 961785941);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (664, 961785961);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (665, 961785973);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (666, 961785983);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (667, 961785991);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (668, 961785997);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (669, 961786027);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (670, 961786043);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (671, 961786057);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (672, 961786109);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (673, 961786127);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (674, 961786141);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (675, 961786157);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (676, 961786187);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (677, 961786261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (678, 961786277);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (679, 961786291);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (680, 961786313);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (681, 961786349);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (682, 961786379);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (683, 961786391);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (684, 961786393);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (685, 961786409);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (686, 961786417);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (687, 961786433);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (688, 961786447);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (689, 961786457);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (690, 961786481);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (691, 961786523);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (692, 961786531);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (693, 961786571);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (694, 961786583);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (695, 961786591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (696, 961786627);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (697, 961786691);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (698, 961786697);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (699, 961786729);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (700, 961786739);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (701, 961786751);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (702, 961786757);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (703, 961786801);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (704, 961786909);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (705, 961786921);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (706, 961786927);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (707, 961786937);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (708, 961786949);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (709, 961786963);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (710, 961786981);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (711, 961786993);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (712, 961786999);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (713, 961787017);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (714, 961787027);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (715, 961787051);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (716, 961787089);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (717, 961787137);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (718, 961787147);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (719, 961787153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (720, 961787171);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (721, 961787209);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (722, 961787219);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (723, 961787221);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (724, 961787243);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (725, 961787263);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (726, 961787269);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (727, 961787279);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (728, 961787363);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (729, 961787377);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (730, 961787413);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (731, 961787473);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (732, 961787503);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (733, 961787521);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (734, 961787591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (735, 961787609);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (736, 961787641);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (737, 961787647);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (738, 961787653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (739, 961787663);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (740, 961787677);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (741, 961787681);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (742, 961787707);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (743, 961787737);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (744, 961787753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (745, 961787777);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (746, 961787789);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (747, 961787807);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (748, 961787819);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (749, 961787821);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (750, 961787831);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (751, 961787839);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (752, 961787887);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (753, 961787899);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (754, 961787917);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (755, 961787933);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (756, 961787947);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (757, 961787977);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (758, 961787993);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (759, 961788001);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (760, 961788017);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (761, 961788019);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (762, 961788049);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (763, 961788071);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (764, 961788089);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (765, 961788167);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (766, 961788169);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (767, 961788173);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (768, 961788187);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (769, 961788193);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (770, 961788199);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (771, 961788203);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (772, 961788229);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (773, 961788239);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (774, 961788241);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (775, 961788253);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (776, 961788257);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (777, 961788259);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (778, 961788329);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (779, 961788367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (780, 961788371);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (781, 961788409);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (782, 961788431);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (783, 961788463);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (784, 961788467);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (785, 961788491);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (786, 961788497);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (787, 961788533);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (788, 961788587);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (789, 961788599);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (790, 961788601);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (791, 961788613);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (792, 961788623);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (793, 961788637);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (794, 961788661);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (795, 961788689);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (796, 961788727);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (797, 961788731);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (798, 961788743);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (799, 961788757);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (800, 961788781);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (801, 961788803);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (802, 961788809);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (803, 961788847);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (804, 961788881);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (805, 961788899);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (806, 961788983);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (807, 961789007);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (808, 961789019);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (809, 961789021);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (810, 961789099);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (811, 961789121);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (812, 961789163);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (813, 961789181);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (814, 961789187);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (815, 961789219);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (816, 961789243);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (817, 961789249);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (818, 961789261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (819, 961789289);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (820, 961789313);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (821, 961789319);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (822, 961789327);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (823, 961789337);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (824, 961789343);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (825, 961789351);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (826, 961789363);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (827, 961789391);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (828, 961789393);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (829, 961789417);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (830, 961789429);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (831, 961789441);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (832, 961789453);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (833, 961789469);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (834, 961789483);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (835, 961789537);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (836, 961789567);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (837, 961789571);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (838, 961789579);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (839, 961789583);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (840, 961789613);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (841, 961789627);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (842, 961789639);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (843, 961789649);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (844, 961789651);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (845, 961789667);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (846, 961789691);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (847, 961789711);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (848, 961789721);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (849, 961789793);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (850, 961789799);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (851, 961789837);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (852, 961789847);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (853, 961789853);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (854, 961789903);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (855, 961789921);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (856, 961789957);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (857, 961789967);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (858, 961789979);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (859, 961789991);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (860, 961790087);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (861, 961790101);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (862, 961790107);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (863, 961790129);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (864, 961790143);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (865, 961790197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (866, 961790237);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (867, 961790239);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (868, 961790261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (869, 961790267);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (870, 961790273);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (871, 961790299);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (872, 961790359);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (873, 961790369);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (874, 961790371);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (875, 961790383);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (876, 961790387);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (877, 961790399);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (878, 961790411);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (879, 961790429);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (880, 961790443);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (881, 961790483);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (882, 961790497);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (883, 961790509);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (884, 961790519);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (885, 961790537);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (886, 961790569);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (887, 961790581);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (888, 961790591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (889, 961790633);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (890, 961790663);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (891, 961790671);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (892, 961790677);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (893, 961790719);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (894, 961790857);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (895, 961790867);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (896, 961790873);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (897, 961790891);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (898, 961790897);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (899, 961790899);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (900, 961790911);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (901, 961790957);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (902, 961790971);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (903, 961790981);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (904, 961791011);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (905, 961791029);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (906, 961791043);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (907, 961791071);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (908, 961791073);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (909, 961791137);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (910, 961791143);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (911, 961791157);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (912, 961791163);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (913, 961791169);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (914, 961791197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (915, 961791199);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (916, 961791203);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (917, 961791211);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (918, 961791223);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (919, 961791241);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (920, 961791287);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (921, 961791307);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (922, 961791319);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (923, 961791353);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (924, 961791359);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (925, 961791361);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (926, 961791421);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (927, 961791427);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (928, 961791433);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (929, 961791451);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (930, 961791463);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (931, 961791487);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (932, 961791517);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (933, 961791539);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (934, 961791553);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (935, 961791581);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (936, 961791599);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (937, 961791601);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (938, 961791619);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (939, 961791629);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (940, 961791659);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (941, 961791661);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (942, 961791679);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (943, 961791797);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (944, 961791821);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (945, 961791877);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (946, 961791889);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (947, 961791893);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (948, 961791947);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (949, 961791977);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (950, 961791979);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (951, 961792003);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (952, 961792031);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (953, 961792033);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (954, 961792159);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (955, 961792177);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (956, 961792207);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (957, 961792213);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (958, 961792229);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (959, 961792241);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (960, 961792261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (961, 961792277);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (962, 961792283);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (963, 961792313);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (964, 961792339);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (965, 961792343);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (966, 961792361);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (967, 961792367);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (968, 961792387);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (969, 961792399);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (970, 961792439);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (971, 961792477);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (972, 961792523);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (973, 961792529);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (974, 961792543);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (975, 961792549);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (976, 961792583);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (977, 961792589);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (978, 961792591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (979, 961792609);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (980, 961792613);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (981, 961792621);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (982, 961792661);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (983, 961792669);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (984, 961792723);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (985, 961792751);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (986, 961792753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (987, 961792757);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (988, 961792759);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (989, 961792781);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (990, 961792789);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (991, 961792813);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (992, 961792823);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (993, 961792849);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (994, 961792873);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (995, 961792891);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (996, 961792943);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (997, 961792987);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (998, 961792999);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (999, 961793009);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1000, 961793017);

--
-- Data for table segu.segu.tprimo (OID = 307189) (LIMIT 1000,230)
--
INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1001, 961793099);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1002, 961793113);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1003, 961793123);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1004, 961793137);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1005, 961793153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1006, 961793159);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1007, 961793171);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1008, 961793221);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1009, 961793237);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1010, 961793249);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1011, 961793267);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1012, 961793269);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1013, 961793291);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1014, 961793311);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1015, 961793351);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1016, 961793353);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1017, 961793387);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1018, 961793389);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1019, 961793419);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1020, 961793423);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1021, 961793431);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1022, 961793449);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1023, 961793473);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1024, 961793501);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1025, 961793531);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1026, 961793537);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1027, 961793549);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1028, 961793551);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1029, 961793579);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1030, 961793603);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1031, 961793611);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1032, 961793617);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1033, 961793627);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1034, 961793641);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1035, 961793647);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1036, 961793687);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1037, 961793689);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1038, 961793713);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1039, 961793743);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1040, 961793753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1041, 961793773);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1042, 961793797);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1043, 961793803);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1044, 961793827);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1045, 961793831);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1046, 961793837);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1047, 961793849);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1048, 961793881);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1049, 961793891);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1050, 961793923);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1051, 961793933);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1052, 961793939);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1053, 961793951);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1054, 961793977);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1055, 961793983);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1056, 961793993);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1057, 961794007);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1058, 961794011);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1059, 961794017);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1060, 961794049);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1061, 961794073);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1062, 961794083);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1063, 961794131);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1064, 961794139);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1065, 961794149);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1066, 961794157);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1067, 961794181);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1068, 961794203);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1069, 961794209);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1070, 961794247);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1071, 961794257);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1072, 961794283);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1073, 961794311);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1074, 961794343);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1075, 961794413);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1076, 961794451);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1077, 961794521);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1078, 961794569);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1079, 961794571);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1080, 961794593);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1081, 961794607);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1082, 961794643);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1083, 961794653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1084, 961794683);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1085, 961794689);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1086, 961794707);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1087, 961794709);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1088, 961794719);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1089, 961794721);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1090, 961794727);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1091, 961794731);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1092, 961794751);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1093, 961794781);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1094, 961794797);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1095, 961794833);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1096, 961794853);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1097, 961794881);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1098, 961794923);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1099, 961794943);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1100, 961794961);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1101, 961794971);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1102, 961794973);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1103, 961795013);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1104, 961795019);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1105, 961795069);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1106, 961795099);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1107, 961795123);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1108, 961795189);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1109, 961795193);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1110, 961795199);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1111, 961795223);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1112, 961795249);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1113, 961795253);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1114, 961795259);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1115, 961795283);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1116, 961795291);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1117, 961795297);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1118, 961795327);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1119, 961795337);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1120, 961795339);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1121, 961795361);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1122, 961795363);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1123, 961795369);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1124, 961795381);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1125, 961795397);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1126, 961795423);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1127, 961795441);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1128, 961795453);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1129, 961795487);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1130, 961795493);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1131, 961795517);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1132, 961795529);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1133, 961795543);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1134, 961795559);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1135, 961795591);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1136, 961795609);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1137, 961795613);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1138, 961795619);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1139, 961795631);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1140, 961795633);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1141, 961795651);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1142, 961795657);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1143, 961795673);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1144, 961795687);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1145, 961795699);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1146, 961795727);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1147, 961795763);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1148, 961795829);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1149, 961795867);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1150, 961795873);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1151, 961795883);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1152, 961795897);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1153, 961795907);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1154, 961795931);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1155, 961795943);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1156, 961795957);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1157, 961795963);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1158, 961795981);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1159, 961796009);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1160, 961796023);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1161, 961796041);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1162, 961796057);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1163, 961796123);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1164, 961796137);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1165, 961796149);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1166, 961796153);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1167, 961796219);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1168, 961796237);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1169, 961796257);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1170, 961796261);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1171, 961796279);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1172, 961796293);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1173, 961796371);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1174, 961796377);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1175, 961796401);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1176, 961796413);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1177, 961796453);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1178, 961796501);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1179, 961796519);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1180, 961796551);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1181, 961796617);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1182, 961796621);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1183, 961796653);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1184, 961796657);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1185, 961796677);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1186, 961796711);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1187, 961796723);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1188, 961796741);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1189, 961796753);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1190, 961796761);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1191, 961796789);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1192, 961796791);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1193, 961796809);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1194, 961796831);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1195, 961796837);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1196, 961796839);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1197, 961796851);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1198, 961796881);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1199, 961796887);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1200, 961796909);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1201, 961796933);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1202, 961796951);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1203, 961796971);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1204, 961796987);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1205, 961797007);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1206, 961797013);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1207, 961797029);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1208, 961797037);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1209, 961797059);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1210, 961797071);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1211, 961797077);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1212, 961797079);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1213, 961797107);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1214, 961797121);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1215, 961797139);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1216, 961797149);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1217, 961797197);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1218, 961797217);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1219, 961797247);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1220, 961797283);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1221, 961797293);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1222, 961797299);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1223, 961797301);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1224, 961797323);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1225, 961797329);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1226, 961797341);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1227, 961797349);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1228, 961797379);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1229, 961797401);

INSERT INTO segu.tprimo (id_primo, numero)
VALUES (1230, 961797407);

--
-- Data for sequence segu.primo_id_primo_seq (OID = 307053)
--
SELECT pg_catalog.setval('segu.tprimo_id_primo_seq', 1230, true);


/********************************************F-DAT-RCM-SEGU-0-15/01/2013********************************************/



/*******************************************I-DAT-JRR-SEGU-0-25/04/2014***********************************************/


select pxp.f_insert_trol ('PXP-Rol inicial', 'PXP-Rol inicial', 'PXP');

/*******************************************F-DAT-JRR-SEGU-0-25/04/2014***********************************************/




/***********************************I-DAT-MZM-SEGU-2-19/06/2019****************************************/
select pxp.f_add_catalog('SEGU','tpersona__tipo_documento','Documento Identidad','documento_identidad','');
select pxp.f_add_catalog('SEGU','tpersona__tipo_documento','Pasaporte','pasaporte','');
select pxp.f_add_catalog('SEGU','tpersona__tipo_documento','Ninguno','ninguno','');

/***********************************F-DAT-MZM-SEGU-2-19/06/2019****************************************/
