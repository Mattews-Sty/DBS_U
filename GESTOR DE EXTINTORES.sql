CREATE DATABASE gestor_Extintores;

Use gestor_Extintores;

CREATE TABLE Proveedores (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Contacto VARCHAR(100)
);

CREATE TABLE Ubicaciones (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30)
);

CREATE TABLE Extintores (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(20),
    Capacidad VARCHAR(4),
    Ubicacion_ID INT,
    Proveedor_ID INT,
    FOREIGN KEY (Ubicacion_ID) REFERENCES Ubicaciones(ID),
    FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(ID)
);

CREATE TABLE FechasCaducidad (
    ID INT PRIMARY KEY AUTO_INCREMENT;
    Extintor_ID INT,
    FechaCaducidad DATE,
    FOREIGN KEY(ID) REFERENCES FechaCaducidad(Extintor_ID),
    FOREIGN KEY (Extintor_ID) REFERENCES Extintores(ID)
);

CREATE TABLE TrazaExtintores (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Extintor_ID INT,
    UbicacionAnterior_ID INT,
    UbicacionNueva_ID INT,
    FechaMovimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Extintor_ID) REFERENCES Extintores(ID),
    FOREIGN KEY (UbicacionAnterior_ID) REFERENCES Ubicaciones(ID),
    FOREIGN KEY (UbicacionNueva_ID) REFERENCES Ubicaciones(ID)
);

INSERT INTO Proveedores (Nombre, Contacto) VALUES
('Extintores Del Valle', 'info@extintoresdelvalle.com'),
('Extintors Corp', 'sales@extintorscorp.com'),
('Distriextintores', 'cont@distriextintores.com');


INSERT INTO Ubicaciones (Nombre) VALUES
('SALA 1'),
('SALA 2'),
('SALA 3'),
('SALON 6A'),
('SALON 14'),
('SALON 30A'),
('SALON 2A'),
('SALON 4'),
('SALON 15'),
('SALON 19'),
('SALON 21'),
('SALON 2'),
('SALON 7'),
('SALON 8'),
('AULA MAX 1 '),
('AULA MAX 2 '),
('AUDITORIO');


INSERT INTO Extintores (Tipo, Capacidad, Ubicacion_ID, Proveedor_ID) VALUES
('Polvo Quimico', '6kg', 1, 1),
('CO2', '4kg', 2, 2),
('Agua', '6kg', 3, 1),
('Polvo Quimico', '4kg', 4, 3),
('CO2', '4kg', 7, 2),
('Polvo Quimico', '6kg', 5, 1),
('CO2', '4kg', 5, 2),
('Agua', '4kg', 4, 1),
('Polvo Quimico', '4kg', 14, 3),
('CO2', '6kg', 9, 2),
('Agua', '4kg', 10, 3),
('Polvo Quimico', '4kg', 8, 1),
('CO2', '6kg', 14, 2),
('Agua', '4kg', 12, 1),
('Polvo Quimico', '6kg', 13, 2),
('Polvo Quimico', '6kg', 7, 1),
('CO2', '4kg', 13, 2),
('Agua', '6kg', 9, 1),
('Polvo Quimico', '4kg', 4, 3),
('CO2', '4kg', 6, 2),
('Polvo Quimico', '6kg', 2, 1),
('CO2', '4kg', 8, 2),
('Agua', '4kg', 8, 1),
('Polvo Quimico', '4kg', 1, 3),
('CO2', '6kg', 1, 2),
('Agua', '4kg', 3, 3),
('Polvo Quimico', '4kg', 2, 1),
('CO2', '6kg', 10, 2),
('Agua', '4kg', 12, 1),
('Polvo Quimico', '6kg', 12, 2),
('Agua', '6kg', 3, 1),
('Polvo Quimico', '4kg', 4, 3),
('CO2', '4kg', 14, 2),
('Polvo Quimico', '6kg', 15, 1),
('CO2', '4kg', 17, 2),
('Agua', '4kg', 14, 1),
('Polvo Quimico', '4kg', 13, 3),
('CO2', '6kg', 12, 2),
('Agua', '4kg', 17, 3),
('Polvo Quimico', '4kg', 16, 1),
('CO2', '6kg', 16, 2),
('Agua', '4kg', 15, 1),
('Polvo Quimico', '6kg', 17, 3);


INSERT INTO FechasCaducidad (Extintor_ID, FechaCaducidad) VALUES
(1, '2024-08-15'),
(2, '2025-03-20'),
(3, '2024-11-10'),
(4, '2025-01-05'),
(5, '2024-09-30'),
(6, '2025-02-15'),
(7, '2024-10-18'),
(8, '2025-04-25'),
(9, '2024-07-10'),
(10, '2025-01-30'),
(11, '2024-10-05'),
(12, '2025-03-10'),
(13, '2024-09-15'),
(14, '2025-02-20'),
(15, '2024-08-05'),
(16, '2024-08-10'),
(17, '2024-08-15'),
(18, '2024-08-20'),
(19, '2024-08-25'),
(20, '2024-08-30'),
(21, '2024-09-05'),
(22, '2024-09-10'),
(23, '2024-09-15'),
(24, '2024-09-20'),
(25, '2024-09-25'),
(26, '2024-09-30'),
(27, '2024-10-05'),
(28, '2024-10-10'),
(29, '2024-10-15'),
(30, '2024-10-20'),
(31, '2024-10-25'),
(32, '2024-10-30'),
(33, '2024-11-05'),
(34, '2024-11-10'),
(35, '2024-11-15'),
(36, '2024-11-20'),
(37, '2024-11-25'),
(38, '2024-12-05'),
(39, '2024-12-10'),
(40, '2024-12-15'),
(41, '2024-12-20'),
(42, '2024-12-25'),
(43, '2025-01-05');
