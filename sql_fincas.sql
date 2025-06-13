-- Crear base de datos
CREATE DATABASE IF NOT EXISTS firma_abogados;
USE firma_abogados;

-- Tabla: abogado
CREATE TABLE abogado (
    id_abogado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    dni VARCHAR(10),
    num_colegiado VARCHAR(20)
);

-- Tabla: comunidad
CREATE TABLE comunidad (
    id_comunidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    id_abogado INT,
    FOREIGN KEY (id_abogado) REFERENCES abogado(id_abogado)
);

-- Tabla: empresa
CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    sector VARCHAR(50),
    telefono VARCHAR(20),
    contacto VARCHAR(50)
);

-- Tabla: propiedad
CREATE TABLE propiedad (
    id_propiedad INT AUTO_INCREMENT PRIMARY KEY,
    id_comunidad INT,
    tipo ENUM('vivienda', 'local', 'oficina'),
    propietario VARCHAR(100),
    porcentaje DECIMAL(5,2),
    FOREIGN KEY (id_comunidad) REFERENCES comunidad(id_comunidad)
);

-- Tabla: recibo
CREATE TABLE recibo (
    id_recibo INT AUTO_INCREMENT PRIMARY KEY,
    id_comunidad INT,
    tipo ENUM('ingreso', 'gasto'),
    fecha DATE,
    monto DECIMAL(10,2),
    pagado BOOLEAN,
    FOREIGN KEY (id_comunidad) REFERENCES comunidad(id_comunidad));
