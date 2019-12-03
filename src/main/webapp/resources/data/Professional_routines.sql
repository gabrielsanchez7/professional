-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Professional
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'Professional'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_oferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_oferta`(
	var_id_usuario int,
    var_id_oferta int,
    var_id_especialidad int,
    var_descripcion text,
    var_precio_hora double
)
BEGIN
	Update tb_oferta
		set id_especialidad = ifnull(var_id_especialidad, id_especialidad),
			descripcion = ifnull(var_descripcion, descripcion),
            precio_hora = ifnull(var_precio_hora, precio_hora)
    where id_usuario = var_id_usuario and id_oferta = var_id_oferta;

	if row_count() = 1 then
		Select 'success';
    else
		Select 'failed';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_usuario`(
	var_id_login varchar(200),
    var_nombre varchar(50),
    var_apellidos varchar(50),
    var_email varchar(50),
    var_contrasena varchar(50),
    var_fecha_nacimiento date,
    var_avatar varchar(200),
    var_celular varchar(9),
    var_calificacion int,
    var_presentacion text,
    var_rol varchar(20),
    var_id_ubigeo int
)
BEGIN
	
	Update tb_usuario
		set nombre = ifnull(var_nombre, nombre),
			apellidos = ifnull(var_apellidos, apellidos),
            email = ifnull(var_email, email),
            contrasena = ifnull(var_contrasena, contrasena),
            fecha_nacimiento = ifnull(var_fecha_nacimiento, fecha_nacimiento),
            avatar = ifnull(var_avatar, avatar),
            celular = ifnull(var_celular, celular),
            calificacion = ifnull(var_calificacion, calificacion),
            presentacion = ifnull(var_presentacion, presentacion),
            rol = ifnull(var_rol, rol),
            id_ubigeo = ifnull(var_id_ubigeo, id_ubigeo)
    where id_usuario = var_id_login;

	if row_count() = 1 then
		Select 'success';
    else
		Select 'failed';
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_atender_reserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_atender_reserva`(
	var_id_reserva int
)
BEGIN
	Update tb_reserva
    set atendido = 'Si'
    where id_reserva = var_id_reserva;
    
    if row_count() = 1 then
		Select 'success';
    else
		Select 'failed';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_usuario`(
	var_email varchar(50),
    var_contrasena varchar(50)
)
BEGIN
	Select 
    us.id_usuario,
        us.id_login,
        us.nombre,
        us.apellidos,
        us.email,
        us.contrasena,
        us.fecha_nacimiento,
        us.avatar,
        us.celular,
        us.calificacion,
        us.presentacion,
        us.tipo_login,
        us.fecha_registro,
        ub.id_ubigeo,
        ub.ciudad,
        ub.provincia,
        ub.distrito,
        us.rol
    from tb_usuario us
    inner join tb_ubigeo ub on us.id_ubigeo = ub.id_ubigeo
    where us.email = var_email and us.contrasena = var_contrasena;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_especialidades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_especialidades`()
BEGIN
	Select * from tb_especialidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_horarios_ocupados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_horarios_ocupados`(
	var_id_oferta int,
    var_fecha date
)
BEGIN
	Select hora, cantidad_horas from tb_reserva
    where id_oferta = var_id_oferta
    and fecha = var_fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_ofertas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_ofertas`(
	var_id_usuario int,
    var_id_oferta int,
    var_id_especialidad int,
    var_menor_precio double,
    var_mayor_precio double
)
BEGIN

	Select
		ofe.id_oferta,
		ofe.descripcion as 'descripcion oferta',
		ofe.precio_hora,
		us.id_usuario,
		us.nombre,
		us.apellidos,
		us.avatar,
		us.celular,
		us.calificacion,
		us.presentacion,
		es.id_especialidad,
		es.descripcion as 'descripcion especialidad',
        ub.id_ubigeo,
        ub.ciudad,
        ub.provincia,
        ub.distrito
	from tb_oferta ofe 
	inner join tb_usuario us on ofe.id_usuario = us.id_usuario
	inner join tb_especialidad es on ofe.id_especialidad = es.id_especialidad
    inner join tb_ubigeo ub on us.id_ubigeo = ub.id_ubigeo
	where case
		when var_id_usuario <> 0 then us.id_usuario = var_id_usuario
        when var_id_oferta <> 0 then ofe.id_oferta = var_id_oferta
        when var_id_especialidad <> 0 then es.id_especialidad = var_id_especialidad
        when var_menor_precio <> 0 and var_mayor_precio <> 0 then ofe.precio_hora between var_menor_precio and var_mayor_precio
        else true
	end;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_reservas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_reservas`(
	var_id_usuario int,
    var_tipo varchar(20)
)
BEGIN
	if var_tipo = 'cliente' then
		
		Select
			re.id_reserva,
			us.id_usuario,
			us.nombre,
			us.apellidos,
			ofe.id_oferta,
			re.precio,
			re.direccion,
			re.fecha,
            re.hora,
            re.cantidad_horas,
            re.atendido
		from tb_reserva re
        inner join tb_oferta ofe on re.id_oferta = ofe.id_oferta
		inner join tb_usuario us on ofe.id_usuario = us.id_usuario
        inner join tb_usuario us2 on re.id_usuario = us2.id_usuario
        where us2.id_usuario = var_id_usuario;
    else
		Select
			re.id_reserva,
			us.id_usuario,
			us2.nombre,
			us2.apellidos,
			ofe.id_oferta,
			re.precio,
			re.direccion,
			re.fecha,
            re.hora,
            re.cantidad_horas,
            re.atendido
		from tb_reserva re
        inner join tb_oferta ofe on re.id_oferta = ofe.id_oferta
		inner join tb_usuario us on re.id_usuario
        inner join tb_usuario us2 on re.id_usuario = us2.id_usuario
		where ofe.id_usuario = us.id_usuario and re.atendido = 'No' ;
	end if;

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_ubigeo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_ubigeo`(
	var_ciudad varchar(50),
    var_provincia varchar(50),
    var_distrito varchar(50)
)
BEGIN

	If var_ciudad is null and var_provincia is null and var_distrito is null then
		Select ciudad, count(*) from tb_ubigeo
        group by ciudad
        order by ciudad asc;
	elseif var_ciudad is not null and var_provincia is null and var_distrito is null then
		Select ciudad, provincia from tb_ubigeo
        where ciudad = var_ciudad
        group by provincia
        order by provincia asc;
	elseif var_ciudad is not null and var_provincia is not null and var_distrito is null then
		Select id_ubigeo, ciudad, provincia, distrito from tb_ubigeo
        where ciudad = var_ciudad
			and provincia = var_provincia;
	else
		Select * from tb_ubigeo
        where ciudad = var_ciudad
			and provincia = var_provincia
            and distrito = var_distrito;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_usuario`(var_id_login varchar(200))
BEGIN
	Select
		us.id_usuario,
        us.id_login,
        us.nombre,
        us.apellidos,
        us.email,
        us.contrasena,
        us.fecha_nacimiento,
        us.avatar,
        us.celular,
        us.calificacion,
        us.presentacion,
        us.tipo_login,
        us.fecha_registro,
        ub.id_ubigeo,
        ub.ciudad,
        ub.provincia,
        ub.distrito,
        us.rol
    from tb_usuario us
    inner join tb_ubigeo ub on us.id_ubigeo = ub.id_ubigeo
    where us.id_login = var_id_login;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_oferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_oferta`(
	var_id_usuario int,
    var_id_especialidad int,
    var_descripcion text,
    var_precio_hora double
)
BEGIN

	Insert into tb_oferta(id_usuario, id_especialidad, descripcion, precio_hora)
	values(var_id_usuario, var_id_especialidad, var_descripcion, var_precio_hora);
	
	if row_count() > 0 then
		Select concat(last_insert_id(), '');
    else
		Select -1;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_reserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_reserva`(
	var_id_reserva int,
    var_id_usuario int,
    var_id_oferta int,
    var_precio double,
    var_direccion text,
    var_fecha date,
    var_hora varchar(20),
    var_cantidad_horas int
)
BEGIN
	Insert into tb_reserva (id_usuario, id_oferta, precio, direccion, fecha, hora, cantidad_horas, atendido)
	values (var_id_usuario, var_id_oferta, var_precio, var_direccion, var_fecha, var_hora, var_cantidad_horas, 'No');
    
    if row_count() > 0 then
		Select concat(last_insert_id(), '');
    else
		Select -1;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_usuario`(
	var_id_login varchar(200),
    var_nombre varchar(50),
    var_apellidos varchar(50),
    var_email varchar(50),
    var_contrasena varchar(50),
    var_avatar varchar(200),
    var_tipo_login varchar(20)
)
BEGIN

    If(Select 1 from tb_usuario where id_login = var_id_login) Then
		Select var_id_login;
    else
		Insert into tb_usuario(id_login, nombre, apellidos, email, contrasena, avatar, tipo_login, fecha_registro, id_ubigeo)
        values(var_id_login, var_nombre, var_apellidos, var_email, var_contrasena, var_avatar, var_tipo_login, now(), 0);
        
        Select concat(last_insert_id(), '');
    End if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 19:59:19
