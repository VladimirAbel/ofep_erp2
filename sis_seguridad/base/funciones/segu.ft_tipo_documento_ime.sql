CREATE OR REPLACE FUNCTION segu.ft_tipo_documento_ime (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla character varying,
  p_transaccion character varying
)
RETURNS varchar
AS 
$body$
/**************************************************************************
 SISTEMA:		Sistema de Seguridad
 FUNCION: 		segu.ft_tipo_documento_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'segu.tproyecto'
 AUTOR: 		 (w)
 FECHA:	        17/09/2019
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
	v_id_tipo_documento	integer;
			
BEGIN

    v_nombre_funcion = 'segu.ft_tipo_documento_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************
 	#TRANSACCION:  'SEG_TIPODOC_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		w	
 	#FECHA:		17/09/2019
	***********************************/

	if(p_transaccion='SEG_TIPODOC_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into segu.ttipo_documento(
            nombre,
            fecha_reg,
            estado_reg
          	) values(
			v_parametros.nombre,
			now(),
			'activo'
			) RETURNING id_tipo_documento into v_id_tipo_documento;

			--Definici?n de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Documento almacenado ('||v_id_tipo_documento||')');
            v_resp = pxp.f_agrega_clave(v_resp,'v_id_tipo_documento',v_id_tipo_documento::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************
 	#TRANSACCION:  'SEG_TIPODOC_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		w	
 	#FECHA:		17/09/2019
	***********************************/

	elsif(p_transaccion='SEG_TIPODOC_MOD')then

		begin
			--Sentencia de la modificacion
            update segu.ttipo_documento set
			nombre = v_parametros.nombre,
            estado_reg = v_parametros.estado_reg
			where id_tipo_documento=v_parametros.id_tipo_documento;

			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Documento modificado(a)');
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_documento',v_parametros.id_tipo_documento::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************
 	#TRANSACCION:  'SEG_TIPODOC_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		w	
 	#FECHA:		17/09/2019
	***********************************/

	elsif(p_transaccion='SEG_TIPODOC_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from segu.ttipo_documento
            where id_tipo_documento=v_parametros.id_tipo_documento;

            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Documentado eliminado(a)');
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_documento',v_parametros.id_tipo_documento::varchar);

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
$body$
    LANGUAGE plpgsql;

