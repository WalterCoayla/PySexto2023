-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 02:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdtecno2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `anexos_documento`
--

CREATE TABLE `anexos_documento` (
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(4000) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idDocumento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anexo_03`
--

CREATE TABLE `anexo_03` (
  `NroModulo` int(11) DEFAULT NULL,
  `Fecha_desde` timestamp NULL DEFAULT NULL,
  `Fecha_hasta` timestamp NULL DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `observaciones` varchar(4000) DEFAULT NULL,
  `pago_por` bit(1) DEFAULT NULL,
  `movilidad` bit(1) DEFAULT NULL,
  `otros` bit(1) DEFAULT NULL,
  `solo_EFSRT` bit(1) DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  `detalle_otros` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anexo_04`
--

CREATE TABLE `anexo_04` (
  `id` int(11) NOT NULL,
  `fecha_inicio` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL,
  `problemas_detectados` char(18) DEFAULT NULL,
  `observaciones` varchar(4000) DEFAULT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `idPrograma_estudios` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `idDocente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anexo_05`
--

CREATE TABLE `anexo_05` (
  `id` int(11) NOT NULL,
  `idPrograma_estudios` int(11) DEFAULT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  `fecha_inicio` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL,
  `Total_horas` int(11) DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `lugar_oficina` bit(1) DEFAULT NULL,
  `lugar_laboratorio` bit(1) DEFAULT NULL,
  `lugar_almacen` bit(1) DEFAULT NULL,
  `lugar_campo` bit(1) DEFAULT NULL,
  `lugar_otros` bit(1) DEFAULT NULL,
  `lugar_taller` bit(1) DEFAULT NULL,
  `detalle_otros` varchar(80) DEFAULT NULL,
  `horario` varchar(50) DEFAULT NULL,
  `tareas` varchar(4000) DEFAULT NULL,
  `total_puntaje` char(18) DEFAULT NULL,
  `fecha_anexo` timestamp NULL DEFAULT NULL,
  `lugar_anexo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asignaciones_bienes`
--

CREATE TABLE `asignaciones_bienes` (
  `fecha` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idServidorPublico` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idJefeInmediato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `tabla` varchar(25) NOT NULL,
  `operacion` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(15) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `datos_new` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datos_new`)),
  `datos_old` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datos_old`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bachilleres`
--

CREATE TABLE `bachilleres` (
  `id` int(11) NOT NULL,
  `tieneIdiomaExtranjero` bit(1) DEFAULT NULL,
  `culminoEstudios` bit(1) DEFAULT NULL,
  `añoTermino` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bachiller_trabajo_aplicacion`
--

CREATE TABLE `bachiller_trabajo_aplicacion` (
  `id` int(11) NOT NULL,
  `idBachiller` int(11) DEFAULT NULL,
  `idTrabajo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cargas_horaria`
--

CREATE TABLE `cargas_horaria` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `idPeriodo` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `idDocente` int(11) DEFAULT NULL,
  `lunes_ini` timestamp NULL DEFAULT NULL,
  `martes_ini` timestamp NULL DEFAULT NULL,
  `miercoles_fin` timestamp NULL DEFAULT NULL,
  `jueves_ini` timestamp NULL DEFAULT NULL,
  `viernes_ini` timestamp NULL DEFAULT NULL,
  `sabado_inicio` timestamp NULL DEFAULT NULL,
  `domingo_ini` timestamp NULL DEFAULT NULL,
  `lunes_fin` timestamp NULL DEFAULT NULL,
  `martes_fin` timestamp NULL DEFAULT NULL,
  `miercoles_ini` timestamp NULL DEFAULT NULL,
  `jueves_fin` timestamp NULL DEFAULT NULL,
  `vienes_fin` timestamp NULL DEFAULT NULL,
  `sabado_fin` timestamp NULL DEFAULT NULL,
  `domingo_fin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`) VALUES
(1, 'Gerente'),
(2, 'Técnico'),
(3, 'Practicantes'),
(4, 'Asistente'),
(5, 'Auxiliar');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conceptos_pago`
--

CREATE TABLE `conceptos_pago` (
  `nombre` varchar(100) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idCta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conceptos_pago`
--

INSERT INTO `conceptos_pago` (`nombre`, `monto`, `id`, `idCta`) VALUES
('Matriculas', 186.00, 1, 1),
('Certificado de Estudios', 120.00, 2, 1),
('Pago de Servicio de Agua', 350.00, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cronogramas_academicos`
--

CREATE TABLE `cronogramas_academicos` (
  `fecha_ini` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idPeriodo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ctas_contables`
--

CREATE TABLE `ctas_contables` (
  `cuenta` varchar(15) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ctas_contables`
--

INSERT INTO `ctas_contables` (`cuenta`, `descripcion`, `id`) VALUES
('1010', 'Recaudaciones', 1),
('2020', 'Pagos Grales', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ht` int(11) DEFAULT NULL,
  `hl` int(11) DEFAULT NULL,
  `cred` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `idSemestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desplazamientos`
--

CREATE TABLE `desplazamientos` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `idServidorOrigen` int(11) DEFAULT NULL,
  `idServidorDestino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalles_asignacion`
--

CREATE TABLE `detalles_asignacion` (
  `id` int(11) NOT NULL,
  `idAsignacion` int(11) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalles_desplazamientos`
--

CREATE TABLE `detalles_desplazamientos` (
  `id` int(11) NOT NULL,
  `idDesplazamiento` int(11) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalles_matricula`
--

CREATE TABLE `detalles_matricula` (
  `id` int(11) NOT NULL,
  `idMatricula` int(11) DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `nroMatricula` int(11) DEFAULT NULL,
  `notaFinal` decimal(5,2) DEFAULT NULL,
  `notaRecuperacion` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalles_pago`
--

CREATE TABLE `detalles_pago` (
  `cant` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `subTotal` decimal(10,2) DEFAULT NULL,
  `idConcepto` int(11) DEFAULT NULL,
  `idPago` int(11) DEFAULT NULL,
  `descuento` decimal(10,2) DEFAULT NULL,
  `igv` decimal(19,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalles_permanencia`
--

CREATE TABLE `detalles_permanencia` (
  `id` int(11) NOT NULL,
  `lunes_ini` timestamp NULL DEFAULT NULL,
  `lunes_fin` timestamp NULL DEFAULT NULL,
  `martes_ini` timestamp NULL DEFAULT NULL,
  `martes_fin` timestamp NULL DEFAULT NULL,
  `miercoles_ini` timestamp NULL DEFAULT NULL,
  `miercoles_fin` timestamp NULL DEFAULT NULL,
  `jueves_ini` timestamp NULL DEFAULT NULL,
  `jueves_fin` timestamp NULL DEFAULT NULL,
  `viernes_ini` timestamp NULL DEFAULT NULL,
  `viernes_fin` timestamp NULL DEFAULT NULL,
  `sabado_ini` timestamp NULL DEFAULT NULL,
  `sabado_fin` timestamp NULL DEFAULT NULL,
  `domingo_ini` timestamp NULL DEFAULT NULL,
  `domingo_fin` char(18) DEFAULT NULL,
  `idFicha` int(11) DEFAULT NULL,
  `idTurno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docentes`
--

CREATE TABLE `docentes` (
  `idPrograma_estudios` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `idDocumento` int(11) DEFAULT NULL,
  `descripcion` varchar(4000) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `fecha_recepcion` timestamp NULL DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `idOficina` int(11) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `editoriales`
--

CREATE TABLE `editoriales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `idCiudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `RazonSocial` varchar(100) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `rubro` varchar(200) DEFAULT NULL,
  `idRepresentante` int(11) DEFAULT NULL,
  `RUC` varchar(11) DEFAULT NULL,
  `esActiva` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `idModelo` int(11) DEFAULT NULL,
  `fechaCompra` timestamp NULL DEFAULT NULL,
  `codigoPatrimonial` varchar(20) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `valorCompra` decimal(19,7) DEFAULT NULL,
  `numeroPECOSA` varchar(20) DEFAULT NULL,
  `numeroOC` varchar(20) DEFAULT NULL,
  `dimensiones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipos_antivirus`
--

CREATE TABLE `equipos_antivirus` (
  `id` int(11) NOT NULL,
  `fecha_vencimiento` timestamp NULL DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `idAntivirus` int(11) DEFAULT NULL,
  `licencia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipos_discos`
--

CREATE TABLE `equipos_discos` (
  `id` int(11) NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `capacidad` varchar(15) DEFAULT NULL,
  `idTipoDisco` int(11) DEFAULT NULL,
  `numeroSerie` varchar(30) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estados`
--

INSERT INTO `estados` (`id`, `nombre`) VALUES
(1, 'Bueno'),
(2, 'Regular'),
(3, 'Malo');

-- --------------------------------------------------------

--
-- Table structure for table `estados_tramites`
--

CREATE TABLE `estados_tramites` (
  `estado` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `idPrograma_estudios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `idPrograma_estudios`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `asistio` int(11) DEFAULT NULL,
  `nota` decimal(5,2) DEFAULT NULL,
  `idSubIndicador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examenes_requisitos`
--

CREATE TABLE `examenes_requisitos` (
  `id` int(11) NOT NULL,
  `idExamen` int(11) DEFAULT NULL,
  `idRequisito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examenes_suficiencia`
--

CREATE TABLE `examenes_suficiencia` (
  `id` int(11) NOT NULL,
  `notaTeoria` decimal(5,2) DEFAULT NULL,
  `notaPractica` decimal(5,2) DEFAULT NULL,
  `idBachiller` int(11) DEFAULT NULL,
  `notaFinal` decimal(5,2) DEFAULT NULL,
  `numeroActa` varchar(50) DEFAULT NULL,
  `acta` varchar(100) DEFAULT NULL,
  `fechaSustentacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factores_forma`
--

CREATE TABLE `factores_forma` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fichas_permanencia`
--

CREATE TABLE `fichas_permanencia` (
  `id` int(11) NOT NULL,
  `idTrabajador` int(11) DEFAULT NULL,
  `fecha_ini` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fichas_postulacion`
--

CREATE TABLE `fichas_postulacion` (
  `id` int(11) NOT NULL,
  `idPago` int(11) DEFAULT NULL,
  `idPostulante` int(11) DEFAULT NULL,
  `idModalidad` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `idPrograma` int(11) DEFAULT NULL,
  `idPeriodo` int(11) DEFAULT NULL,
  `puntaje` decimal(19,7) DEFAULT NULL,
  `puesto` int(11) DEFAULT NULL,
  `ingreso` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicadores`
--

CREATE TABLE `indicadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `idDetalleMatricula` int(11) DEFAULT NULL,
  `promedio` decimal(5,2) DEFAULT NULL,
  `notaRecuperacion` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicadores_anexo`
--

CREATE TABLE `indicadores_anexo` (
  `id` int(11) NOT NULL,
  `idAnexo` int(11) DEFAULT NULL,
  `idIndicador` int(11) DEFAULT NULL,
  `calificacion` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicadores_evaluacion`
--

CREATE TABLE `indicadores_evaluacion` (
  `id` int(11) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `idTipo_indicador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurados_examen_suficiencia`
--

CREATE TABLE `jurados_examen_suficiencia` (
  `id` int(11) NOT NULL,
  `idExamen` int(11) DEFAULT NULL,
  `idJurado` int(11) DEFAULT NULL,
  `notaTeoria` decimal(5,2) DEFAULT NULL,
  `notaPractica` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurados_trabajo_aplicacion`
--

CREATE TABLE `jurados_trabajo_aplicacion` (
  `id` int(11) NOT NULL,
  `idTrabajo` int(11) DEFAULT NULL,
  `idJurado` int(11) DEFAULT NULL,
  `notaJurado` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justificaciones_asistencia`
--

CREATE TABLE `justificaciones_asistencia` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `idTurno` int(11) DEFAULT NULL,
  `idMotivo` int(11) DEFAULT NULL,
  `justificacion` char(18) DEFAULT NULL,
  `idTrabajador` int(11) DEFAULT NULL,
  `idJefe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `codigo` varchar(15) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `edicion` int(11) DEFAULT NULL,
  `numeroCopias` int(11) DEFAULT NULL,
  `idEditorial` int(11) DEFAULT NULL,
  `cantidadConsultas` int(11) DEFAULT NULL,
  `cantidadFavoritos` int(11) DEFAULT NULL,
  `portada` varchar(50) DEFAULT NULL,
  `psinopsis` varchar(4000) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `numeroPaginas` int(11) DEFAULT NULL,
  `año_edicion` varchar(4) DEFAULT NULL,
  `idIdioma` int(11) DEFAULT NULL,
  `volumen` int(11) DEFAULT NULL,
  `codigoDEWEY` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libro_autores`
--

CREATE TABLE `libro_autores` (
  `id` int(11) NOT NULL,
  `idAutor` int(11) DEFAULT NULL,
  `idLibro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libro_materias`
--

CREATE TABLE `libro_materias` (
  `id` int(11) NOT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `idLibro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `nombre` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matriculas`
--

CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `idPeriodo` int(11) DEFAULT NULL,
  `idPago` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mis_favoritos`
--

CREATE TABLE `mis_favoritos` (
  `id` int(11) NOT NULL,
  `Fecha_registro` timestamp NULL DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `idLibro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modalidades`
--

CREATE TABLE `modalidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modalides_ingreso`
--

CREATE TABLE `modalides_ingreso` (
  `id` int(11) NOT NULL,
  `modalidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modelos`
--

CREATE TABLE `modelos` (
  `nombre` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `detalles` varchar(100) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `idPlan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modulos_sys`
--

CREATE TABLE `modulos_sys` (
  `nombre` varchar(50) DEFAULT NULL,
  `version` varchar(12) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `icono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modulos_sys`
--

INSERT INTO `modulos_sys` (`nombre`, `version`, `id`, `icono`) VALUES
('Módulo de Trámite Documentario', '1.0.0', 1, 'tramite.png'),
('Módulo de Caja', '1.0.0', 2, 'caja.png');

-- --------------------------------------------------------

--
-- Table structure for table `motivos_salida`
--

CREATE TABLE `motivos_salida` (
  `motivo` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oficinas`
--

CREATE TABLE `oficinas` (
  `id` int(11) NOT NULL,
  `idOficina` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `idJefe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `fecha` timestamp NULL DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `numero` varchar(12) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `idCajero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `papeletas_salida`
--

CREATE TABLE `papeletas_salida` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `hora_retorno` timestamp NULL DEFAULT NULL,
  `hora_salida` timestamp NULL DEFAULT NULL,
  `sinRetorno` char(18) DEFAULT NULL,
  `fecha_ini` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL,
  `idTrabajador` int(11) DEFAULT NULL,
  `idJefe` int(11) DEFAULT NULL,
  `idMotivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pcs`
--

CREATE TABLE `pcs` (
  `idTipoProcesador` int(11) DEFAULT NULL,
  `detallesSO` varchar(100) DEFAULT NULL,
  `idSO` int(11) DEFAULT NULL,
  `detallesTipoProcesador` varchar(100) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idFactorForma` int(11) DEFAULT NULL,
  `detallesFactorForma` varchar(100) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `direccionIP` varchar(20) DEFAULT NULL,
  `mascaraRed` varchar(20) DEFAULT NULL,
  `PuertaEnlace` mediumblob DEFAULT NULL,
  `DNS1` varchar(20) DEFAULT NULL,
  `DNS2` varchar(20) DEFAULT NULL,
  `numeroSerie` varchar(30) DEFAULT NULL,
  `nombrePC` varchar(30) DEFAULT NULL,
  `usuarioPC` varchar(30) DEFAULT NULL,
  `clavePC` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pc_perifericos`
--

CREATE TABLE `pc_perifericos` (
  `id` int(11) NOT NULL,
  `idPC` int(11) DEFAULT NULL,
  `idPeriferico` int(11) DEFAULT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `perfil` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perfiles`
--

INSERT INTO `perfiles` (`id`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Docente'),
(3, 'Estudiante'),
(4, 'Administrativo'),
(5, 'Visitante');

-- --------------------------------------------------------

--
-- Table structure for table `perifericos`
--

CREATE TABLE `perifericos` (
  `nombre` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periodos_academico`
--

CREATE TABLE `periodos_academico` (
  `id` int(11) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `inicio` timestamp NULL DEFAULT NULL,
  `fin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  `idPerfil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permisos`
--

INSERT INTO `permisos` (`id`, `idPersona`, `idModulo`, `idPerfil`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 4),
(3, 2, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `fechaNacimiento` timestamp NULL DEFAULT NULL,
  `genero` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id`, `nombres`, `apellidos`, `dni`, `correo`, `direccion`, `Telefono`, `password`, `usuario`, `fechaNacimiento`, `genero`) VALUES
(1, 'Juan', 'Perez', '12345678', 'jperez@gmail.com', 'av. Bolivar 123', '999925651', '123456', 'juan', '2003-09-25 22:42:39', b'0'),
(2, 'Pedro', 'Vargas', '457812', 'pedro@gmail.com', 'Av. Balta 32145', '94512211', '1234', 'pedro', '1995-04-15 05:00:00', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `planes_estudio`
--

CREATE TABLE `planes_estudio` (
  `id` int(11) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `idPrograma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postulantes`
--

CREATE TABLE `postulantes` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programas_estudios`
--

CREATE TABLE `programas_estudios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `idTurno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programas_estudios`
--

INSERT INTO `programas_estudios` (`id`, `nombre`, `logo`, `idTurno`) VALUES
(1, 'APSTI', 'APSTI.JPG', 2),
(2, 'Contabilidad', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `registros_asistencia`
--

CREATE TABLE `registros_asistencia` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `hora_ingreso` timestamp NULL DEFAULT NULL,
  `hora_salida` timestamp NULL DEFAULT NULL,
  `idTrabajador` int(11) DEFAULT NULL,
  `idTurno` int(11) DEFAULT NULL,
  `idJustificacion` int(11) DEFAULT NULL,
  `idPapeleta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `representantes`
--

CREATE TABLE `representantes` (
  `id` int(11) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisitos`
--

CREATE TABLE `requisitos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `idModalidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisitos_postulacion`
--

CREATE TABLE `requisitos_postulacion` (
  `requisito` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `idModalidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisitos_presentados`
--

CREATE TABLE `requisitos_presentados` (
  `id` int(11) NOT NULL,
  `idFicha` int(11) DEFAULT NULL,
  `idRequisito` int(11) DEFAULT NULL,
  `presento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semestres`
--

CREATE TABLE `semestres` (
  `id` int(11) NOT NULL,
  `semestre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servidores_publicos`
--

CREATE TABLE `servidores_publicos` (
  `id` int(11) NOT NULL,
  `idCargo` int(11) DEFAULT NULL,
  `fecha_inicio` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sistemas_operativos`
--

CREATE TABLE `sistemas_operativos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subindicadores`
--

CREATE TABLE `subindicadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `promedio` decimal(5,2) DEFAULT NULL,
  `notaRecuperacion` decimal(5,2) DEFAULT NULL,
  `idIndicador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sw_antivirus`
--

CREATE TABLE `sw_antivirus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_curso`
--

CREATE TABLE `tipos_curso` (
  `id` int(11) NOT NULL,
  `tipo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_disco`
--

CREATE TABLE `tipos_disco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_documentos`
--

CREATE TABLE `tipos_documentos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_indicadores`
--

CREATE TABLE `tipos_indicadores` (
  `id` int(11) NOT NULL,
  `item` varchar(1) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_matricula`
--

CREATE TABLE `tipos_matricula` (
  `tipo` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_pago`
--

CREATE TABLE `tipos_pago` (
  `tipo` varchar(30) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `banco` varchar(30) DEFAULT NULL,
  `nroCuenta` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_procesadores`
--

CREATE TABLE `tipos_procesadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trabajos_aplicacion_profesional`
--

CREATE TABLE `trabajos_aplicacion_profesional` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `idAsesor` int(11) DEFAULT NULL,
  `fechaSustentacion` timestamp NULL DEFAULT NULL,
  `notaFinal` decimal(5,2) DEFAULT NULL,
  `numeroActa` varchar(50) DEFAULT NULL,
  `acta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trabajos_requisitos`
--

CREATE TABLE `trabajos_requisitos` (
  `id` int(11) NOT NULL,
  `idTrabajo` int(11) DEFAULT NULL,
  `idRequisito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tramites_documentarios`
--

CREATE TABLE `tramites_documentarios` (
  `id` int(11) NOT NULL,
  `idDocumento` int(11) DEFAULT NULL,
  `idOficinaOrigen` int(11) DEFAULT NULL,
  `idOficinaDestino` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `fecha_envio` timestamp NULL DEFAULT NULL,
  `fecha_recepcion` timestamp NULL DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `turnos`
--

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `turno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turnos`
--

INSERT INTO `turnos` (`id`, `turno`) VALUES
(1, 'MAÑANA'),
(2, 'TARDE');

-- --------------------------------------------------------

--
-- Table structure for table `visitas_anexo04`
--

CREATE TABLE `visitas_anexo04` (
  `id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `tareas` varchar(150) DEFAULT NULL,
  `porcentaje_avance` int(11) DEFAULT NULL,
  `idAnexo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_conceptos_pago`
-- (See below for the actual view)
--
CREATE TABLE `v_conceptos_pago` (
`nombre` varchar(100)
,`monto` decimal(10,2)
,`id` int(11)
,`idCta` int(11)
,`cuenta` varchar(15)
,`descripcion` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estudiante`
-- (See below for the actual view)
--
CREATE TABLE `v_estudiante` (
`id` int(11)
,`nombres` varchar(50)
,`apellidos` varchar(50)
,`dni` varchar(8)
,`correo` varchar(60)
,`genero` bit(1)
,`direccion` varchar(150)
,`Telefono` varchar(15)
,`password` varchar(25)
,`usuario` varchar(20)
,`fechaNacimiento` timestamp
,`idPrograma_estudios` int(11)
,`programa` varchar(80)
);

-- --------------------------------------------------------

--
-- Structure for view `v_conceptos_pago`
--
DROP TABLE IF EXISTS `v_conceptos_pago`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_conceptos_pago`  AS SELECT `cp`.`nombre` AS `nombre`, `cp`.`monto` AS `monto`, `cp`.`id` AS `id`, `cp`.`idCta` AS `idCta`, `cc`.`cuenta` AS `cuenta`, `cc`.`descripcion` AS `descripcion` FROM (`conceptos_pago` `cp` join `ctas_contables` `cc` on(`cp`.`idCta` = `cc`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_estudiante`
--
DROP TABLE IF EXISTS `v_estudiante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estudiante`  AS SELECT `p`.`id` AS `id`, `p`.`nombres` AS `nombres`, `p`.`apellidos` AS `apellidos`, `p`.`dni` AS `dni`, `p`.`correo` AS `correo`, `p`.`genero` AS `genero`, `p`.`direccion` AS `direccion`, `p`.`Telefono` AS `Telefono`, `p`.`password` AS `password`, `p`.`usuario` AS `usuario`, `p`.`fechaNacimiento` AS `fechaNacimiento`, `e`.`idPrograma_estudios` AS `idPrograma_estudios`, `pe`.`nombre` AS `programa` FROM ((`estudiantes` `e` join `personas` `p` on(`e`.`id` = `p`.`id`)) join `programas_estudios` `pe` on(`e`.`idPrograma_estudios` = `pe`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anexos_documento`
--
ALTER TABLE `anexos_documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_128` (`idDocumento`);

--
-- Indexes for table `anexo_03`
--
ALTER TABLE `anexo_03`
  ADD KEY `R_2` (`idEmpresa`),
  ADD KEY `R_6` (`idModulo`),
  ADD KEY `R_8` (`idEstudiante`);

--
-- Indexes for table `anexo_04`
--
ALTER TABLE `anexo_04`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_14` (`idEstudiante`),
  ADD KEY `R_15` (`idPrograma_estudios`),
  ADD KEY `R_16` (`idModulo`),
  ADD KEY `R_17` (`idEmpresa`),
  ADD KEY `R_18` (`idDocente`);

--
-- Indexes for table `anexo_05`
--
ALTER TABLE `anexo_05`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_21` (`idPrograma_estudios`),
  ADD KEY `R_22` (`idEstudiante`),
  ADD KEY `R_23` (`idModulo`),
  ADD KEY `R_24` (`idEmpresa`);

--
-- Indexes for table `asignaciones_bienes`
--
ALTER TABLE `asignaciones_bienes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_88` (`idServidorPublico`),
  ADD KEY `R_92` (`idEstado`),
  ADD KEY `R_93` (`idJefeInmediato`);

--
-- Indexes for table `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bachilleres`
--
ALTER TABLE `bachilleres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bachiller_trabajo_aplicacion`
--
ALTER TABLE `bachiller_trabajo_aplicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_46` (`idBachiller`),
  ADD KEY `R_47` (`idTrabajo`);

--
-- Indexes for table `cargas_horaria`
--
ALTER TABLE `cargas_horaria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_107` (`idPeriodo`),
  ADD KEY `R_108` (`idCurso`),
  ADD KEY `R_109` (`idDocente`);

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conceptos_pago`
--
ALTER TABLE `conceptos_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_150` (`idCta`);

--
-- Indexes for table `cronogramas_academicos`
--
ALTER TABLE `cronogramas_academicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_122` (`idPeriodo`);

--
-- Indexes for table `ctas_contables`
--
ALTER TABLE `ctas_contables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_103` (`idModulo`),
  ADD KEY `R_104` (`idTipo`),
  ADD KEY `R_105` (`idSemestre`);

--
-- Indexes for table `desplazamientos`
--
ALTER TABLE `desplazamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_94` (`idServidorOrigen`),
  ADD KEY `R_95` (`idServidorDestino`);

--
-- Indexes for table `detalles_asignacion`
--
ALTER TABLE `detalles_asignacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_90` (`idAsignacion`),
  ADD KEY `R_91` (`idEquipo`);

--
-- Indexes for table `detalles_desplazamientos`
--
ALTER TABLE `detalles_desplazamientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_96` (`idDesplazamiento`),
  ADD KEY `R_97` (`idEquipo`);

--
-- Indexes for table `detalles_matricula`
--
ALTER TABLE `detalles_matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_99` (`idMatricula`),
  ADD KEY `R_100` (`idCurso`);

--
-- Indexes for table `detalles_pago`
--
ALTER TABLE `detalles_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_117` (`idConcepto`),
  ADD KEY `R_118` (`idPago`);

--
-- Indexes for table `detalles_permanencia`
--
ALTER TABLE `detalles_permanencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_157` (`idFicha`),
  ADD KEY `R_158` (`idTurno`);

--
-- Indexes for table `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_7` (`idPrograma_estudios`);

--
-- Indexes for table `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_134` (`idTipo`),
  ADD KEY `R_135` (`idOficina`),
  ADD KEY `R_136` (`idDocumento`),
  ADD KEY `R_137` (`idPersona`);

--
-- Indexes for table `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_36` (`idCiudad`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_13` (`idRepresentante`);

--
-- Indexes for table `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_82` (`idModelo`);

--
-- Indexes for table `equipos_antivirus`
--
ALTER TABLE `equipos_antivirus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_76` (`idAntivirus`);

--
-- Indexes for table `equipos_discos`
--
ALTER TABLE `equipos_discos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_78` (`idTipoDisco`),
  ADD KEY `R_80` (`idEstado`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estados_tramites`
--
ALTER TABLE `estados_tramites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_9` (`idPrograma_estudios`);

--
-- Indexes for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_116` (`idSubIndicador`);

--
-- Indexes for table `examenes_requisitos`
--
ALTER TABLE `examenes_requisitos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_63` (`idExamen`),
  ADD KEY `R_64` (`idRequisito`);

--
-- Indexes for table `examenes_suficiencia`
--
ALTER TABLE `examenes_suficiencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_58` (`idBachiller`);

--
-- Indexes for table `factores_forma`
--
ALTER TABLE `factores_forma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fichas_permanencia`
--
ALTER TABLE `fichas_permanencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_156` (`idTrabajador`);

--
-- Indexes for table `fichas_postulacion`
--
ALTER TABLE `fichas_postulacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_142` (`idPago`),
  ADD KEY `R_143` (`idPostulante`),
  ADD KEY `R_144` (`idModalidad`),
  ADD KEY `R_145` (`idPrograma`),
  ADD KEY `R_146` (`idPeriodo`);

--
-- Indexes for table `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_113` (`idDetalleMatricula`);

--
-- Indexes for table `indicadores_anexo`
--
ALTER TABLE `indicadores_anexo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_25` (`idAnexo`),
  ADD KEY `R_26` (`idIndicador`);

--
-- Indexes for table `indicadores_evaluacion`
--
ALTER TABLE `indicadores_evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_27` (`idTipo_indicador`);

--
-- Indexes for table `jurados_examen_suficiencia`
--
ALTER TABLE `jurados_examen_suficiencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_57` (`idExamen`),
  ADD KEY `R_59` (`idJurado`);

--
-- Indexes for table `jurados_trabajo_aplicacion`
--
ALTER TABLE `jurados_trabajo_aplicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_54` (`idTrabajo`),
  ADD KEY `R_55` (`idJurado`);

--
-- Indexes for table `justificaciones_asistencia`
--
ALTER TABLE `justificaciones_asistencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_164` (`idTurno`),
  ADD KEY `R_165` (`idMotivo`),
  ADD KEY `R_166` (`idTrabajador`),
  ADD KEY `R_167` (`idJefe`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_32` (`idEditorial`),
  ADD KEY `R_37` (`idIdioma`);

--
-- Indexes for table `libro_autores`
--
ALTER TABLE `libro_autores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_30` (`idAutor`),
  ADD KEY `R_31` (`idLibro`);

--
-- Indexes for table `libro_materias`
--
ALTER TABLE `libro_materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_34` (`idMateria`),
  ADD KEY `R_35` (`idLibro`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_38` (`idCategoria`);

--
-- Indexes for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_98` (`idEstudiante`),
  ADD KEY `R_106` (`idPeriodo`),
  ADD KEY `R_119` (`idPago`),
  ADD KEY `R_121` (`idTipo`);

--
-- Indexes for table `mis_favoritos`
--
ALTER TABLE `mis_favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_28` (`idPersona`),
  ADD KEY `R_33` (`idLibro`);

--
-- Indexes for table `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modalides_ingreso`
--
ALTER TABLE `modalides_ingreso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_69` (`idMarca`);

--
-- Indexes for table `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_102` (`idPlan`);

--
-- Indexes for table `modulos_sys`
--
ALTER TABLE `modulos_sys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `motivos_salida`
--
ALTER TABLE `motivos_salida`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_123` (`idOficina`),
  ADD KEY `R_149` (`idJefe`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_120` (`idTipo`),
  ADD KEY `R_139` (`idPersona`),
  ADD KEY `R_151` (`idCajero`);

--
-- Indexes for table `papeletas_salida`
--
ALTER TABLE `papeletas_salida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_161` (`idTrabajador`),
  ADD KEY `R_162` (`idJefe`),
  ADD KEY `R_163` (`idMotivo`);

--
-- Indexes for table `pcs`
--
ALTER TABLE `pcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_71` (`idTipoProcesador`),
  ADD KEY `R_72` (`idSO`),
  ADD KEY `R_74` (`idEstado`),
  ADD KEY `R_75` (`idFactorForma`);

--
-- Indexes for table `pc_perifericos`
--
ALTER TABLE `pc_perifericos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_85` (`idPC`),
  ADD KEY `R_86` (`idPeriferico`),
  ADD KEY `R_87` (`idEstado`);

--
-- Indexes for table `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perifericos`
--
ALTER TABLE `perifericos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_84` (`idEstado`);

--
-- Indexes for table `periodos_academico`
--
ALTER TABLE `periodos_academico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_153` (`idPersona`),
  ADD KEY `R_154` (`idModulo`),
  ADD KEY `R_155` (`idPerfil`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planes_estudio`
--
ALTER TABLE `planes_estudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_101` (`idPrograma`);

--
-- Indexes for table `postulantes`
--
ALTER TABLE `postulantes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programas_estudios`
--
ALTER TABLE `programas_estudios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_111` (`idTurno`);

--
-- Indexes for table `registros_asistencia`
--
ALTER TABLE `registros_asistencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_159` (`idTrabajador`),
  ADD KEY `R_160` (`idTurno`),
  ADD KEY `R_168` (`idJustificacion`),
  ADD KEY `R_169` (`idPapeleta`);

--
-- Indexes for table `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requisitos`
--
ALTER TABLE `requisitos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_62` (`idModalidad`);

--
-- Indexes for table `requisitos_postulacion`
--
ALTER TABLE `requisitos_postulacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_141` (`idModalidad`);

--
-- Indexes for table `requisitos_presentados`
--
ALTER TABLE `requisitos_presentados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_147` (`idFicha`),
  ADD KEY `R_148` (`idRequisito`);

--
-- Indexes for table `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servidores_publicos`
--
ALTER TABLE `servidores_publicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_68` (`idCargo`);

--
-- Indexes for table `sistemas_operativos`
--
ALTER TABLE `sistemas_operativos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subindicadores`
--
ALTER TABLE `subindicadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_115` (`idIndicador`);

--
-- Indexes for table `sw_antivirus`
--
ALTER TABLE `sw_antivirus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_curso`
--
ALTER TABLE `tipos_curso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_disco`
--
ALTER TABLE `tipos_disco`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_indicadores`
--
ALTER TABLE `tipos_indicadores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_matricula`
--
ALTER TABLE `tipos_matricula`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_pago`
--
ALTER TABLE `tipos_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_procesadores`
--
ALTER TABLE `tipos_procesadores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trabajos_aplicacion_profesional`
--
ALTER TABLE `trabajos_aplicacion_profesional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_56` (`idAsesor`);

--
-- Indexes for table `trabajos_requisitos`
--
ALTER TABLE `trabajos_requisitos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_60` (`idTrabajo`),
  ADD KEY `R_61` (`idRequisito`);

--
-- Indexes for table `tramites_documentarios`
--
ALTER TABLE `tramites_documentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_129` (`idDocumento`),
  ADD KEY `R_130` (`idOficinaOrigen`),
  ADD KEY `R_131` (`idOficinaDestino`),
  ADD KEY `R_133` (`idEstado`);

--
-- Indexes for table `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitas_anexo04`
--
ALTER TABLE `visitas_anexo04`
  ADD PRIMARY KEY (`id`),
  ADD KEY `R_20` (`idAnexo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anexos_documento`
--
ALTER TABLE `anexos_documento`
  ADD CONSTRAINT `R_128` FOREIGN KEY (`idDocumento`) REFERENCES `documentos` (`id`);

--
-- Constraints for table `anexo_03`
--
ALTER TABLE `anexo_03`
  ADD CONSTRAINT `R_2` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `R_6` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `R_8` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`id`);

--
-- Constraints for table `anexo_04`
--
ALTER TABLE `anexo_04`
  ADD CONSTRAINT `R_14` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`id`),
  ADD CONSTRAINT `R_15` FOREIGN KEY (`idPrograma_estudios`) REFERENCES `programas_estudios` (`id`),
  ADD CONSTRAINT `R_16` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `R_17` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `R_18` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`id`);

--
-- Constraints for table `anexo_05`
--
ALTER TABLE `anexo_05`
  ADD CONSTRAINT `R_21` FOREIGN KEY (`idPrograma_estudios`) REFERENCES `programas_estudios` (`id`),
  ADD CONSTRAINT `R_22` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`id`),
  ADD CONSTRAINT `R_23` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `R_24` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`id`);

--
-- Constraints for table `asignaciones_bienes`
--
ALTER TABLE `asignaciones_bienes`
  ADD CONSTRAINT `R_88` FOREIGN KEY (`idServidorPublico`) REFERENCES `servidores_publicos` (`id`),
  ADD CONSTRAINT `R_92` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `R_93` FOREIGN KEY (`idJefeInmediato`) REFERENCES `servidores_publicos` (`id`);

--
-- Constraints for table `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `R_29` FOREIGN KEY (`id`) REFERENCES `personas` (`id`);

--
-- Constraints for table `bachilleres`
--
ALTER TABLE `bachilleres`
  ADD CONSTRAINT `R_39` FOREIGN KEY (`id`) REFERENCES `estudiantes` (`id`);

--
-- Constraints for table `bachiller_trabajo_aplicacion`
--
ALTER TABLE `bachiller_trabajo_aplicacion`
  ADD CONSTRAINT `R_46` FOREIGN KEY (`idBachiller`) REFERENCES `bachilleres` (`id`),
  ADD CONSTRAINT `R_47` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajos_aplicacion_profesional` (`id`);

--
-- Constraints for table `cargas_horaria`
--
ALTER TABLE `cargas_horaria`
  ADD CONSTRAINT `R_107` FOREIGN KEY (`idPeriodo`) REFERENCES `periodos_academico` (`id`),
  ADD CONSTRAINT `R_108` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `R_109` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`id`);

--
-- Constraints for table `conceptos_pago`
--
ALTER TABLE `conceptos_pago`
  ADD CONSTRAINT `R_150` FOREIGN KEY (`idCta`) REFERENCES `ctas_contables` (`id`);

--
-- Constraints for table `cronogramas_academicos`
--
ALTER TABLE `cronogramas_academicos`
  ADD CONSTRAINT `R_122` FOREIGN KEY (`idPeriodo`) REFERENCES `periodos_academico` (`id`);

--
-- Constraints for table `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `R_103` FOREIGN KEY (`idModulo`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `R_104` FOREIGN KEY (`idTipo`) REFERENCES `tipos_curso` (`id`),
  ADD CONSTRAINT `R_105` FOREIGN KEY (`idSemestre`) REFERENCES `semestres` (`id`);

--
-- Constraints for table `desplazamientos`
--
ALTER TABLE `desplazamientos`
  ADD CONSTRAINT `R_94` FOREIGN KEY (`idServidorOrigen`) REFERENCES `servidores_publicos` (`id`),
  ADD CONSTRAINT `R_95` FOREIGN KEY (`idServidorDestino`) REFERENCES `servidores_publicos` (`id`);

--
-- Constraints for table `detalles_asignacion`
--
ALTER TABLE `detalles_asignacion`
  ADD CONSTRAINT `R_90` FOREIGN KEY (`idAsignacion`) REFERENCES `asignaciones_bienes` (`id`),
  ADD CONSTRAINT `R_91` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`id`);

--
-- Constraints for table `detalles_desplazamientos`
--
ALTER TABLE `detalles_desplazamientos`
  ADD CONSTRAINT `R_96` FOREIGN KEY (`idDesplazamiento`) REFERENCES `desplazamientos` (`id`),
  ADD CONSTRAINT `R_97` FOREIGN KEY (`idEquipo`) REFERENCES `equipos` (`id`);

--
-- Constraints for table `detalles_matricula`
--
ALTER TABLE `detalles_matricula`
  ADD CONSTRAINT `R_100` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `R_99` FOREIGN KEY (`idMatricula`) REFERENCES `matriculas` (`id`);

--
-- Constraints for table `detalles_pago`
--
ALTER TABLE `detalles_pago`
  ADD CONSTRAINT `R_117` FOREIGN KEY (`idConcepto`) REFERENCES `conceptos_pago` (`id`),
  ADD CONSTRAINT `R_118` FOREIGN KEY (`idPago`) REFERENCES `pagos` (`id`);

--
-- Constraints for table `detalles_permanencia`
--
ALTER TABLE `detalles_permanencia`
  ADD CONSTRAINT `R_157` FOREIGN KEY (`idFicha`) REFERENCES `fichas_permanencia` (`id`),
  ADD CONSTRAINT `R_158` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`id`);

--
-- Constraints for table `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `R_10` FOREIGN KEY (`id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `R_7` FOREIGN KEY (`idPrograma_estudios`) REFERENCES `programas_estudios` (`id`);

--
-- Constraints for table `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `R_134` FOREIGN KEY (`idTipo`) REFERENCES `tipos_documentos` (`id`),
  ADD CONSTRAINT `R_135` FOREIGN KEY (`idOficina`) REFERENCES `oficinas` (`id`),
  ADD CONSTRAINT `R_136` FOREIGN KEY (`idDocumento`) REFERENCES `documentos` (`id`),
  ADD CONSTRAINT `R_137` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`);

--
-- Constraints for table `editoriales`
--
ALTER TABLE `editoriales`
  ADD CONSTRAINT `R_36` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`id`);

--
-- Constraints for table `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `R_13` FOREIGN KEY (`idRepresentante`) REFERENCES `representantes` (`id`);

--
-- Constraints for table `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `R_82` FOREIGN KEY (`idModelo`) REFERENCES `modelos` (`id`);

--
-- Constraints for table `equipos_antivirus`
--
ALTER TABLE `equipos_antivirus`
  ADD CONSTRAINT `R_76` FOREIGN KEY (`idAntivirus`) REFERENCES `sw_antivirus` (`id`),
  ADD CONSTRAINT `R_77` FOREIGN KEY (`id`) REFERENCES `pcs` (`id`);

--
-- Constraints for table `equipos_discos`
--
ALTER TABLE `equipos_discos`
  ADD CONSTRAINT `R_78` FOREIGN KEY (`idTipoDisco`) REFERENCES `tipos_disco` (`id`),
  ADD CONSTRAINT `R_79` FOREIGN KEY (`id`) REFERENCES `pcs` (`id`),
  ADD CONSTRAINT `R_80` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`id`);

--
-- Constraints for table `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `R_11` FOREIGN KEY (`id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `R_9` FOREIGN KEY (`idPrograma_estudios`) REFERENCES `programas_estudios` (`id`);

--
-- Constraints for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `R_116` FOREIGN KEY (`idSubIndicador`) REFERENCES `subindicadores` (`id`);

--
-- Constraints for table `examenes_requisitos`
--
ALTER TABLE `examenes_requisitos`
  ADD CONSTRAINT `R_63` FOREIGN KEY (`idExamen`) REFERENCES `examenes_suficiencia` (`id`),
  ADD CONSTRAINT `R_64` FOREIGN KEY (`idRequisito`) REFERENCES `requisitos` (`id`);

--
-- Constraints for table `examenes_suficiencia`
--
ALTER TABLE `examenes_suficiencia`
  ADD CONSTRAINT `R_58` FOREIGN KEY (`idBachiller`) REFERENCES `bachilleres` (`id`);

--
-- Constraints for table `fichas_permanencia`
--
ALTER TABLE `fichas_permanencia`
  ADD CONSTRAINT `R_156` FOREIGN KEY (`idTrabajador`) REFERENCES `servidores_publicos` (`id`);

--
-- Constraints for table `fichas_postulacion`
--
ALTER TABLE `fichas_postulacion`
  ADD CONSTRAINT `R_142` FOREIGN KEY (`idPago`) REFERENCES `pagos` (`id`),
  ADD CONSTRAINT `R_143` FOREIGN KEY (`idPostulante`) REFERENCES `postulantes` (`id`),
  ADD CONSTRAINT `R_144` FOREIGN KEY (`idModalidad`) REFERENCES `modalides_ingreso` (`id`),
  ADD CONSTRAINT `R_145` FOREIGN KEY (`idPrograma`) REFERENCES `programas_estudios` (`id`),
  ADD CONSTRAINT `R_146` FOREIGN KEY (`idPeriodo`) REFERENCES `periodos_academico` (`id`);

--
-- Constraints for table `indicadores`
--
ALTER TABLE `indicadores`
  ADD CONSTRAINT `R_113` FOREIGN KEY (`idDetalleMatricula`) REFERENCES `detalles_matricula` (`id`);

--
-- Constraints for table `indicadores_anexo`
--
ALTER TABLE `indicadores_anexo`
  ADD CONSTRAINT `R_25` FOREIGN KEY (`idAnexo`) REFERENCES `anexo_05` (`id`),
  ADD CONSTRAINT `R_26` FOREIGN KEY (`idIndicador`) REFERENCES `indicadores_evaluacion` (`id`);

--
-- Constraints for table `indicadores_evaluacion`
--
ALTER TABLE `indicadores_evaluacion`
  ADD CONSTRAINT `R_27` FOREIGN KEY (`idTipo_indicador`) REFERENCES `tipos_indicadores` (`id`);

--
-- Constraints for table `jurados_examen_suficiencia`
--
ALTER TABLE `jurados_examen_suficiencia`
  ADD CONSTRAINT `R_57` FOREIGN KEY (`idExamen`) REFERENCES `examenes_suficiencia` (`id`),
  ADD CONSTRAINT `R_59` FOREIGN KEY (`idJurado`) REFERENCES `docentes` (`id`);

--
-- Constraints for table `jurados_trabajo_aplicacion`
--
ALTER TABLE `jurados_trabajo_aplicacion`
  ADD CONSTRAINT `R_54` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajos_aplicacion_profesional` (`id`),
  ADD CONSTRAINT `R_55` FOREIGN KEY (`idJurado`) REFERENCES `docentes` (`id`);

--
-- Constraints for table `justificaciones_asistencia`
--
ALTER TABLE `justificaciones_asistencia`
  ADD CONSTRAINT `R_164` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`id`),
  ADD CONSTRAINT `R_165` FOREIGN KEY (`idMotivo`) REFERENCES `motivos_salida` (`id`),
  ADD CONSTRAINT `R_166` FOREIGN KEY (`idTrabajador`) REFERENCES `servidores_publicos` (`id`),
  ADD CONSTRAINT `R_167` FOREIGN KEY (`idJefe`) REFERENCES `servidores_publicos` (`id`);

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `R_32` FOREIGN KEY (`idEditorial`) REFERENCES `editoriales` (`id`),
  ADD CONSTRAINT `R_37` FOREIGN KEY (`idIdioma`) REFERENCES `idiomas` (`id`);

--
-- Constraints for table `libro_autores`
--
ALTER TABLE `libro_autores`
  ADD CONSTRAINT `R_30` FOREIGN KEY (`idAutor`) REFERENCES `autores` (`id`),
  ADD CONSTRAINT `R_31` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`id`);

--
-- Constraints for table `libro_materias`
--
ALTER TABLE `libro_materias`
  ADD CONSTRAINT `R_34` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `R_35` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`id`);

--
-- Constraints for table `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `R_38` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);

--
-- Constraints for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `R_106` FOREIGN KEY (`idPeriodo`) REFERENCES `periodos_academico` (`id`),
  ADD CONSTRAINT `R_119` FOREIGN KEY (`idPago`) REFERENCES `pagos` (`id`),
  ADD CONSTRAINT `R_121` FOREIGN KEY (`idTipo`) REFERENCES `tipos_matricula` (`id`),
  ADD CONSTRAINT `R_98` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`id`);

--
-- Constraints for table `mis_favoritos`
--
ALTER TABLE `mis_favoritos`
  ADD CONSTRAINT `R_28` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `R_33` FOREIGN KEY (`idLibro`) REFERENCES `libros` (`id`);

--
-- Constraints for table `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `R_69` FOREIGN KEY (`idMarca`) REFERENCES `marcas` (`id`);

--
-- Constraints for table `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `R_102` FOREIGN KEY (`idPlan`) REFERENCES `planes_estudio` (`id`);

--
-- Constraints for table `oficinas`
--
ALTER TABLE `oficinas`
  ADD CONSTRAINT `R_123` FOREIGN KEY (`idOficina`) REFERENCES `oficinas` (`id`),
  ADD CONSTRAINT `R_149` FOREIGN KEY (`idJefe`) REFERENCES `servidores_publicos` (`id`);

--
-- Constraints for table `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `R_120` FOREIGN KEY (`idTipo`) REFERENCES `tipos_pago` (`id`),
  ADD CONSTRAINT `R_139` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `R_151` FOREIGN KEY (`idCajero`) REFERENCES `servidores_publicos` (`id`);

--
-- Constraints for table `papeletas_salida`
--
ALTER TABLE `papeletas_salida`
  ADD CONSTRAINT `R_161` FOREIGN KEY (`idTrabajador`) REFERENCES `servidores_publicos` (`id`),
  ADD CONSTRAINT `R_162` FOREIGN KEY (`idJefe`) REFERENCES `servidores_publicos` (`id`),
  ADD CONSTRAINT `R_163` FOREIGN KEY (`idMotivo`) REFERENCES `motivos_salida` (`id`);

--
-- Constraints for table `pcs`
--
ALTER TABLE `pcs`
  ADD CONSTRAINT `R_71` FOREIGN KEY (`idTipoProcesador`) REFERENCES `tipos_procesadores` (`id`),
  ADD CONSTRAINT `R_72` FOREIGN KEY (`idSO`) REFERENCES `sistemas_operativos` (`id`),
  ADD CONSTRAINT `R_74` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `R_75` FOREIGN KEY (`idFactorForma`) REFERENCES `factores_forma` (`id`),
  ADD CONSTRAINT `R_81` FOREIGN KEY (`id`) REFERENCES `equipos` (`id`);

--
-- Constraints for table `pc_perifericos`
--
ALTER TABLE `pc_perifericos`
  ADD CONSTRAINT `R_85` FOREIGN KEY (`idPC`) REFERENCES `pcs` (`id`),
  ADD CONSTRAINT `R_86` FOREIGN KEY (`idPeriferico`) REFERENCES `perifericos` (`id`),
  ADD CONSTRAINT `R_87` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`id`);

--
-- Constraints for table `perifericos`
--
ALTER TABLE `perifericos`
  ADD CONSTRAINT `R_83` FOREIGN KEY (`id`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `R_84` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`id`);

--
-- Constraints for table `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `R_153` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `R_154` FOREIGN KEY (`idModulo`) REFERENCES `modulos_sys` (`id`),
  ADD CONSTRAINT `R_155` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles` (`id`);

--
-- Constraints for table `planes_estudio`
--
ALTER TABLE `planes_estudio`
  ADD CONSTRAINT `R_101` FOREIGN KEY (`idPrograma`) REFERENCES `programas_estudios` (`id`);

--
-- Constraints for table `postulantes`
--
ALTER TABLE `postulantes`
  ADD CONSTRAINT `R_140` FOREIGN KEY (`id`) REFERENCES `personas` (`id`);

--
-- Constraints for table `programas_estudios`
--
ALTER TABLE `programas_estudios`
  ADD CONSTRAINT `R_111` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`id`);

--
-- Constraints for table `registros_asistencia`
--
ALTER TABLE `registros_asistencia`
  ADD CONSTRAINT `R_159` FOREIGN KEY (`idTrabajador`) REFERENCES `servidores_publicos` (`id`),
  ADD CONSTRAINT `R_160` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`id`),
  ADD CONSTRAINT `R_168` FOREIGN KEY (`idJustificacion`) REFERENCES `justificaciones_asistencia` (`id`),
  ADD CONSTRAINT `R_169` FOREIGN KEY (`idPapeleta`) REFERENCES `papeletas_salida` (`id`);

--
-- Constraints for table `representantes`
--
ALTER TABLE `representantes`
  ADD CONSTRAINT `R_12` FOREIGN KEY (`id`) REFERENCES `personas` (`id`);

--
-- Constraints for table `requisitos`
--
ALTER TABLE `requisitos`
  ADD CONSTRAINT `R_62` FOREIGN KEY (`idModalidad`) REFERENCES `modalidades` (`id`);

--
-- Constraints for table `requisitos_postulacion`
--
ALTER TABLE `requisitos_postulacion`
  ADD CONSTRAINT `R_141` FOREIGN KEY (`idModalidad`) REFERENCES `modalides_ingreso` (`id`);

--
-- Constraints for table `requisitos_presentados`
--
ALTER TABLE `requisitos_presentados`
  ADD CONSTRAINT `R_147` FOREIGN KEY (`idFicha`) REFERENCES `fichas_postulacion` (`id`),
  ADD CONSTRAINT `R_148` FOREIGN KEY (`idRequisito`) REFERENCES `requisitos_postulacion` (`id`);

--
-- Constraints for table `servidores_publicos`
--
ALTER TABLE `servidores_publicos`
  ADD CONSTRAINT `R_67` FOREIGN KEY (`id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `R_68` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`id`);

--
-- Constraints for table `subindicadores`
--
ALTER TABLE `subindicadores`
  ADD CONSTRAINT `R_115` FOREIGN KEY (`idIndicador`) REFERENCES `indicadores` (`id`);

--
-- Constraints for table `trabajos_aplicacion_profesional`
--
ALTER TABLE `trabajos_aplicacion_profesional`
  ADD CONSTRAINT `R_56` FOREIGN KEY (`idAsesor`) REFERENCES `docentes` (`id`);

--
-- Constraints for table `trabajos_requisitos`
--
ALTER TABLE `trabajos_requisitos`
  ADD CONSTRAINT `R_60` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajos_aplicacion_profesional` (`id`),
  ADD CONSTRAINT `R_61` FOREIGN KEY (`idRequisito`) REFERENCES `requisitos` (`id`);

--
-- Constraints for table `tramites_documentarios`
--
ALTER TABLE `tramites_documentarios`
  ADD CONSTRAINT `R_129` FOREIGN KEY (`idDocumento`) REFERENCES `documentos` (`id`),
  ADD CONSTRAINT `R_130` FOREIGN KEY (`idOficinaOrigen`) REFERENCES `oficinas` (`id`),
  ADD CONSTRAINT `R_131` FOREIGN KEY (`idOficinaDestino`) REFERENCES `oficinas` (`id`),
  ADD CONSTRAINT `R_133` FOREIGN KEY (`idEstado`) REFERENCES `estados_tramites` (`id`);

--
-- Constraints for table `visitas_anexo04`
--
ALTER TABLE `visitas_anexo04`
  ADD CONSTRAINT `R_20` FOREIGN KEY (`idAnexo`) REFERENCES `anexo_04` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
