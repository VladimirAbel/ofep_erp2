CREATE OR REPLACE FUNCTION "param"."f_regional_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Parametros Generales
 FUNCION: 		param.f_regional_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'param.tregional'
 AUTOR: 		Gonzalo Sarmiento Sejas
 FECHA:	        05-02-2013 23:27:42
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_regional	integer;
			    
BEGIN

    v_nombre_funcion = 'param.f_regional_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'PM_REGIO_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		Gonzalo Sarmiento Sejas	
 	#FECHA:		05-02-2013 23:27:42
	***********************************/

	if(p_transaccion='PM_REGIO_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into param.tregional(
			estado_reg,
			id_regional_actif,
			nombre_regional,
			codigo_regional,
			descripcion_regional,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			'activo',
			v_parametros.id_regional_actif,
			v_parametros.nombre_regional,
			v_parametros.codigo_regional,
			v_parametros.descripcion_regional,
			now(),
			p_id_usuario,
			null,
			null
							
			)RETURNING id_regional into v_id_regional;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Regional almacenado(a) con exito (id_regional'||v_id_regional||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_regional',v_id_regional::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'PM_REGIO_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		Gonzalo Sarmiento Sejas	
 	#FECHA:		05-02-2013 23:27:42
	***********************************/

	elsif(p_transaccion='PM_REGIO_MOD')then

		begin
			--Sentencia de la modificacion
			update param.tregional set
			id_regional_actif = v_parametros.id_regional_actif,
			nombre_regional = v_parametros.nombre_regional,
			codigo_regional = v_parametros.codigo_regional,
			descripcion_regional = v_parametros.descripcion_regional,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario
			where id_regional=v_parametros.id_regional;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Regional modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_regional',v_parametros.id_regional::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'PM_REGIO_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		Gonzalo Sarmiento Sejas	
 	#FECHA:		05-02-2013 23:27:42
	***********************************/

	elsif(p_transaccion='PM_REGIO_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from param.tregional
            where id_regional=v_parametros.id_regional;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Regional eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_regional',v_parametros.id_regional::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "param"."f_regional_ime"(integer, integer, character varying, character varying) OWNER TO postgres;