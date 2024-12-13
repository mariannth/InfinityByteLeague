Drop database if  exists `IBLUNO`;
CREATE SCHEMA IF NOT EXISTS `IBLUNO` DEFAULT CHARACTER SET utf8 ;
USE `IBLUNO` ;

-- -----------------------------------------------------
-- Table `mydb`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`paises` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nombre_pais` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`estados` (
  `id_estados` INT NOT NULL AUTO_INCREMENT,
  `nombre_estados` VARCHAR(100) NOT NULL,
  `paises_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_estados`, `paises_id_pais`),
  INDEX `fk_estados_paises1_idx` (`paises_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_estados_paises1`
    FOREIGN KEY (`paises_id_pais`)
    REFERENCES `IBLUNO`.`paises` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`municipios` (
  `id_municipios` INT NOT NULL AUTO_INCREMENT,
  `nombre_municipios` VARCHAR(100) NOT NULL,
  `estados_id_estados` INT NOT NULL,
  `estados_paises_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_municipios`, `estados_id_estados`, `estados_paises_id_pais`),
  INDEX `fk_municipios_estados1_idx` (`estados_id_estados` ASC, `estados_paises_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_municipios_estados1`
    FOREIGN KEY (`estados_id_estados` , `estados_paises_id_pais`)
    REFERENCES `IBLUNO`.`estados` (`id_estados` , `paises_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido_materno` VARCHAR(45) NOT NULL,
  `apellido_paterno` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `rfc` VARCHAR(45) NOT NULL,
  `paises_id_pais` INT NOT NULL,
  `estados_id_estados` INT NOT NULL,
  `estados_paises_id_pais` INT NOT NULL,
  `municipios_id_municipios` INT NOT NULL,
  `municipios_estados_id_estados` INT NOT NULL,
  `municipios_estados_paises_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_paises1_idx` (`paises_id_pais` ASC) VISIBLE,
  INDEX `fk_usuario_estados1_idx` (`estados_id_estados` ASC, `estados_paises_id_pais` ASC) VISIBLE,
  INDEX `fk_usuario_municipios1_idx` (`municipios_id_municipios` ASC, `municipios_estados_id_estados` ASC, `municipios_estados_paises_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_paises1`
    FOREIGN KEY (`paises_id_pais`)
    REFERENCES `IBLUNO`.`paises` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_estados1`
    FOREIGN KEY (`estados_id_estados` , `estados_paises_id_pais`)
    REFERENCES `IBLUNO`.`estados` (`id_estados` , `paises_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_municipios1`
    FOREIGN KEY (`municipios_id_municipios` , `municipios_estados_id_estados` , `municipios_estados_paises_id_pais`)
    REFERENCES `IBLUNO`.`municipios` (`id_municipios` , `estados_id_estados` , `estados_paises_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';

-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `stock` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_categoria1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `IBLUNO`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `estado_de_pedido` TEXT NOT NULL,
  `total` VARCHAR(45) NOT NULL,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedido_usuario_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_usuario`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `IBLUNO`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`pago` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `descuento` DOUBLE NOT NULL,
  `tipo_de_pago` VARCHAR(45) NOT NULL,
  `iva` DOUBLE NOT NULL,
  `folio_factura` VARCHAR(45) NOT NULL,
  `pedido_id_pedido` INT NOT NULL,
  PRIMARY KEY (`id_pago`),
  INDEX `fk_pago_pedido1_idx` (`pedido_id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_pago_pedido1`
    FOREIGN KEY (`pedido_id_pedido`)
    REFERENCES `IBLUNO`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '									';


-- -----------------------------------------------------
-- Table `mydb`.`pedido_has_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IBLUNO`.`pedido_has_producto` (
  `pedido_id_pedido` INT NOT NULL,
  `producto_id_producto` INT NOT NULL,
  PRIMARY KEY (`pedido_id_pedido`, `producto_id_producto`),
  INDEX `fk_pedido_has_producto_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  INDEX `fk_pedido_has_producto_pedido1_idx` (`pedido_id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_producto_pedido1`
    FOREIGN KEY (`pedido_id_pedido`)
    REFERENCES `IBLUNO`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_producto_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `IBLUNO`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Inician los inserts ------
-- Paises --
INSERT INTO `IBLUNO`.`paises` (`nombre_pais`) VALUES
('Afganistán'),
('Albania'),
('Alemania'),
('Andorra'),
('Angola'),
('Antigua y Barbuda'),
('Arabia Saudita'),
('Argelia'),
('Argentina'),
('Armenia'),
('Australia'),
('Austria'),
('Azerbaiyán'),
('Bahamas'),
('Bangladés'),
('Barbados'),
('Baréin'),
('Bélgica'),
('Belice'),
('Benín'),
('Bielorrusia'),
('Birmania'),
('Bolivia'),
('Bosnia y Herzegovina'),
('Botsuana'),
('Brasil'),
('Brunéi'),
('Bulgaria'),
('Burkina Faso'),
('Burundi'),
('Bután'),
('Cabo Verde'),
('Camboya'),
('Camerún'),
('Canadá'),
('Catar'),
('Chad'),
('Chile'),
('China'),
('Chipre'),
('Colombia'),
('Comoras'),
('Corea del Norte'),
('Corea del Sur'),
('Costa de Marfil'),
('Costa Rica'),
('Croacia'),
('Cuba'),
('Dinamarca'),
('Dominica'),
('Ecuador'),
('Egipto'),
('El Salvador'),
('Emiratos Árabes Unidos'),
('Eritrea'),
('Eslovaquia'),
('Eslovenia'),
('España'),
('Estados Unidos'),
('Estonia'),
('Esuatini'),
('Etiopía'),
('Filipinas'),
('Finlandia'),
('Fiyi'),
('Francia'),
('Gabón'),
('Gambia'),
('Georgia'),
('Ghana'),
('Granada'),
('Grecia'),
('Guatemala'),
('Guyana'),
('Guinea'),
('Guinea-Bisáu'),
('Guinea Ecuatorial'),
('Haití'),
('Honduras'),
('Hungría'),
('India'),
('Indonesia'),
('Irak'),
('Irán'),
('Irlanda'),
('Islandia'),
('Islas Marshall'),
('Islas Salomón'),
('Israel'),
('Italia'),
('Jamaica'),
('Japón'),
('Jordania'),
('Kazajistán'),
('Kenia'),
('Kirguistán'),
('Kiribati'),
('Kosovo'),
('Kuwait'),
('Laos'),
('Lesoto'),
('Letonia'),
('Líbano'),
('Liberia'),
('Libia'),
('Liechtenstein'),
('Lituania'),
('Luxemburgo'),
('Madagascar'),
('Malasia'),
('Malaui'),
('Maldivas'),
('Malí'),
('Malta'),
('Marruecos'),
('Mauricio'),
('Mauritania'),
('México'),
('Micronesia'),
('Moldavia'),
('Mónaco'),
('Mongolia'),
('Montenegro'),
('Mozambique'),
('Namibia'),
('Nauru'),
('Nepal'),
('Nicaragua'),
('Níger'),
('Nigeria'),
('Noruega'),
('Nueva Zelanda'),
('Omán'),
('Países Bajos'),
('Pakistán'),
('Palaos'),
('Panamá'),
('Papúa Nueva Guinea'),
('Paraguay'),
('Perú'),
('Polonia'),
('Portugal'),
('Reino Unido'),
('República Centroafricana'),
('República Checa'),
('República de Macedonia del Norte'),
('República del Congo'),
('República Democrática del Congo'),
('República Dominicana'),
('Ruanda'),
('Rumania'),
('Rusia'),
('Samoa'),
('San Cristóbal y Nieves'),
('San Marino'),
('San Vicente y las Granadinas'),
('Santa Lucía'),
('Santo Tomé y Príncipe'),
('Senegal'),
('Serbia'),
('Seychelles'),
('Sierra Leona'),
('Singapur'),
('Siria'),
('Somalia'),
('Sri Lanka'),
('Sudáfrica'),
('Sudán'),
('Sudán del Sur'),
('Suecia'),
('Suiza'),
('Surinam'),
('Tailandia'),
('Tanzania'),
('Tayikistán'),
('Timor Oriental'),
('Togo'),
('Tonga'),
('Trinidad y Tobago'),
('Túnez'),
('Turkmenistán'),
('Turquía'),
('Tuvalu'),
('Ucrania'),
('Uganda'),
('Uruguay'),
('Uzbekistán'),
('Vanuatu'),
('Vaticano'),
('Venezuela'),
('Vietnam'),
('Yemen'),
('Yibuti'),
('Zambia'),
('Zimbabue');

Select * from paises where nombre_pais = "Mexico";
-- Estados --
INSERT INTO `IBLUNO`.`estados` (`nombre_estados`, `paises_id_pais`) VALUES
('Aguascalientes', 118),
('Baja California', 118),
('Baja California Sur', 118),
('Campeche', 118),
('Chiapas', 118),
('Chihuahua', 118),
('Ciudad de México', 118),
('Coahuila', 118),
('Colima', 118),
('Durango', 118),
('Guanajuato', 118),
('Guerrero', 118),
('Hidalgo', 118),
('Jalisco', 118),
('México', 118),
('Michoacán', 118),
('Morelos', 118),
('Nayarit', 118),
('Nuevo León', 118),
('Oaxaca', 118),
('Puebla', 118),
('Querétaro', 118),
('Quintana Roo', 118),
('San Luis Potosí', 118),
('Sinaloa', 118),
('Sonora', 118),
('Tabasco', 118),
('Tamaulipas', 118),
('Tlaxcala', 118),
('Veracruz', 118),
('Yucatán', 118),
('Zacatecas', 118);

-- Municipios ---
-- Insertar todos los municipios de México en la tabla `municipios`
INSERT INTO `IBLUNO`.`municipios` (`nombre_municipios`, `estados_id_estados`, `estados_paises_id_pais`) VALUES 
('Aguascalientes', 1, 118),
('Asientos', 1, 118),
('Calvillo', 1, 118), 
('Cosío', 1, 118),
('Jesús María', 1, 118 ),
('Pabellón de Arteaga', 1, 118 ),
('Rincón de Romos', 1, 118 ),
('San José de Gracia', 1, 118 ),
('Tepezalá', 1, 118 ),
('El Llano', 1, 118 ),
('San Francisco de los Romo', 1, 118 ),
('Ensenada', 2, 118 ),
('Mexicali', 2, 118 ),
('Tecate', 2, 118 ),
('Tijuana', 2, 118 ),
('Playas de Rosarito', 2, 118 ),
('Comondú', 3, 118 ),
('La Paz', 3, 118 ),
('Loreto', 3, 118 ),
('Los Cabos', 3, 118 ),
('Mulegé', 3, 118 );

-- Usuarios --
INSERT INTO `IBLUNO`.`usuario` 
(`nombre`, `apellido_materno`, `apellido_paterno`, `email`, `password`, `telefono`, `direccion`, `rfc`, 
`paises_id_pais`, `estados_id_estados`, `estados_paises_id_pais`, `municipios_id_municipios`, 
`municipios_estados_id_estados`, `municipios_estados_paises_id_pais`) 
VALUES 
-- Usuario 1
 ('Juan', 'Pérez', 'López', 'juan.perez@gmail.com', 'password123', '5523456789', 'Av. Principal 123', 'JPL890123ABC', 18, 1, 118, 1, 1, 118),
-- Usuario 2
 ('María', 'Gómez', 'Ramírez', 'maria.gomez@gmail.com', 'password456', '5534567890', 'Calle Secundaria 45', 'MGR900124XYZ', 118, 1, 118, 2, 1, 118),
-- Usuario 3
 ('Carlos', 'Martínez', 'Hernández', 'carlos.martinez@gmail.com', 'password789', '5545678901', 'Calle Central 67', 'CMH850125QWE', 118, 1, 118, 1, 1, 118),
-- Usuario 4
 ('Ana', 'Fernández', 'Cruz', 'ana.fernandez@gmail.com', 'password101', '5556789012', 'Calle Norte 89', 'AFC920126RTY', 118, 2, 118, 2, 1, 118),
-- Usuario 5
('Luis', 'Hernández', 'Díaz', 'luis.hernandez@gmail.com', 'password202', '5567890123', 'Calle Sur 10', 'LHD910127UIO', 
118, 1, 118, 3, 1, 118);


-- categoria --

INSERT INTO categoria (nombre, descripcion) VALUE

('Computadoras', 'Equipos de cómputo personales y de oficina'),
('Smartphones', 'Teléfonos inteligentes y accesorios'),
('Laptops', 'Compactas y ligeras'),
('Tablets', 'Tablets de buena calidad'),
('Audifonos', 'Aislantes del ruido y comodos'),
('Cables', 'HDMI y USB'),
('Camara web', 'Ideal para videollamadas importantes'),
('Mouse', 'Vital para tu kit de programador'),
('Smartwatch', 'Controla el ritmo de tu vida'),
('VR', 'La realidad virtual al alcance de unas gafas'),
('Teclado', 'Comodos y necesarios para tu kit de programador');

-- Productos -- 
INSERT INTO producto (sku, descripcion, precio, url, stock, marca, nombre_producto, categoria_id_categoria) VALUES
(100001, 'Laptop Acer Aspire 3', 8700, '/src/img/productos/ACER2.jpg', 100, 'ACER', 'Aspire 3', 3);

INSERT INTO producto (sku, descripcion, precio, url, stock, marca, nombre_producto, categoria_id_categoria) VALUES
 (100002,  'Laptop ASUS VivoBook 5', 8600, '/src/img/productos/ASUS3.jpg', '100', 'ASUS' 'VivoBook 5', 'Laptops');
 
 (100003,  'Laptop DELL Inspiron 15',  8499, '/src/img/productos/DELL2.jpg', '100', 'DELL' 'Inspiron 15', 'Laptops'),
 (100004,  'Laptop HP Pavilion x360',  10999, '/src/img/productos/HP3.jpg', '100', 'HP' 'Pavilion x360', 'Laptops'),
 (100005,  'Lenovo IdeaPad 3', 7000, '/src/img/productos/LENOVO2.jpg', '100', 'Lenovo' 'IdeaPad 3', 'Laptops'),
