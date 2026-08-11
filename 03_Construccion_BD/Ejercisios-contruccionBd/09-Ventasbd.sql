CREATE DATABASE VentasDB;
GO

USE VentasDB;
GO

CREATE TABLE Category (
    CategoryId INT IDENTITY(1,1) NOT NULL,
    CategoryName VARCHAR(80) NOT NULL,
    Description VARCHAR(200) NULL,

    CONSTRAINT pk_category
    PRIMARY KEY (CategoryId),

    CONSTRAINT uq_category_name
    UNIQUE (CategoryName)
);
GO

CREATE TABLE Supplier (
    SupplierId INT IDENTITY(1,1) NOT NULL,
    CompanyName VARCHAR(100) NOT NULL,
    Contact VARCHAR(100) NOT NULL,
    Address VARCHAR(150) NOT NULL,
    City VARCHAR(80) NOT NULL,
    Region VARCHAR(80) NULL,
    Fax VARCHAR(20) NULL,

    CONSTRAINT pk_supplier
    PRIMARY KEY (SupplierId),

    CONSTRAINT uq_supplier_company_name
    UNIQUE (CompanyName)
);
GO

CREATE TABLE Shipper (
    ShipperId INT IDENTITY(1,1) NOT NULL,
    CompanyName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,

    CONSTRAINT pk_shipper
    PRIMARY KEY (ShipperId),

    CONSTRAINT uq_shipper_company_name
    UNIQUE (CompanyName),

    CONSTRAINT uq_shipper_phone
    UNIQUE (Phone)
);
GO

CREATE TABLE Entity (
    AddressId INT IDENTITY(1,1) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    AddressLine1 VARCHAR(150) NOT NULL,
    AddressLine2 VARCHAR(150) NULL,

    CONSTRAINT pk_entity
    PRIMARY KEY (AddressId)
);
GO

CREATE TABLE Customer (
    CustomerId INT IDENTITY(1,1) NOT NULL,
    CompanyName VARCHAR(100) NOT NULL,
    Contact VARCHAR(100) NOT NULL,
    City VARCHAR(80) NOT NULL,
    Region VARCHAR(80) NULL,
    AddressId INT NOT NULL,

    CONSTRAINT pk_customer
    PRIMARY KEY (CustomerId),

    CONSTRAINT uq_customer_company_name
    UNIQUE (CompanyName),

    CONSTRAINT fk_customer_entity
    FOREIGN KEY (AddressId)
    REFERENCES Entity (AddressId)
);
GO

CREATE TABLE Employee (
    EmployeeId INT IDENTITY(1,1) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(150) NOT NULL,
    ReportsTo INT NULL,

    CONSTRAINT pk_employee
    PRIMARY KEY (EmployeeId),

    CONSTRAINT fk_employee_reports_to
    FOREIGN KEY (ReportsTo)
    REFERENCES Employee (EmployeeId)
);
GO

CREATE TABLE Product (
    ProductId INT IDENTITY(1,1) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    QuantityPerUnit VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    UnitsInStock INT NOT NULL,
    CategoryId INT NOT NULL,
    SupplierId INT NOT NULL,

    CONSTRAINT pk_product
    PRIMARY KEY (ProductId),

    CONSTRAINT uq_product_name
    UNIQUE (ProductName),

    CONSTRAINT ck_product_unit_price
    CHECK (UnitPrice > 0),

    CONSTRAINT ck_product_units_in_stock
    CHECK (UnitsInStock >= 0),

    CONSTRAINT fk_product_category
    FOREIGN KEY (CategoryId)
    REFERENCES Category (CategoryId),

    CONSTRAINT fk_product_supplier
    FOREIGN KEY (SupplierId)
    REFERENCES Supplier (SupplierId)
);
GO

CREATE TABLE Orders (
    OrderId INT IDENTITY(1,1) NOT NULL,
    OrderDate DATE NOT NULL,
    RequiredDate DATE NOT NULL,
    CustomerId INT NOT NULL,
    EmployeeId INT NOT NULL,
    ShipperId INT NOT NULL,

    CONSTRAINT pk_orders
    PRIMARY KEY (OrderId),

    CONSTRAINT ck_orders_required_date
    CHECK (RequiredDate >= OrderDate),

    CONSTRAINT fk_orders_customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customer (CustomerId),

    CONSTRAINT fk_orders_employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (EmployeeId),

    CONSTRAINT fk_orders_shipper
    FOREIGN KEY (ShipperId)
    REFERENCES Shipper (ShipperId)
);
GO

CREATE TABLE Details (
    ProductId INT NOT NULL,
    OrderId INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(5,2) NOT NULL
        CONSTRAINT df_details_discount
        DEFAULT 0,

    CONSTRAINT pk_details
    PRIMARY KEY (ProductId, OrderId),

    CONSTRAINT ck_details_quantity
    CHECK (Quantity > 0),

    CONSTRAINT ck_details_unit_price
    CHECK (UnitPrice > 0),

    CONSTRAINT ck_details_discount
    CHECK (Discount BETWEEN 0 AND 100),

    CONSTRAINT fk_details_product
    FOREIGN KEY (ProductId)
    REFERENCES Product (ProductId),

    CONSTRAINT fk_details_orders
    FOREIGN KEY (OrderId)
    REFERENCES Orders (OrderId)
);
GO

INSERT INTO Category ( CategoryName, Description
)
VALUES
('Bebidas', 'Productos líquidos y refrescos'),
('Lácteos', 'Leche, queso y productos derivados'),
('Panadería', 'Pan, galletas y productos horneados'),
('Limpieza', 'Productos para limpieza del hogar');
GO

INSERT INTO Supplier ( CompanyName, Contact, Address, City, Region, Fax)
VALUES
('Distribuidora Hidalgo', 'Carlos Méndez', 'Avenida Juárez 120', 'Tula de Allende', 'Hidalgo', '7731001001'),
('Alimentos del Centro', 'María López', 'Calle Reforma 45', 'Tepeji del Río', 'Hidalgo', '7732002002'),
('Productos La Esperanza', 'José Hernández', 'Calle Morelos 87', 'Atitalaquia', 'Hidalgo', NULL);
GO

INSERT INTO Shipper ( CompanyName, Phone)
VALUES
('Transportes Rápidos', '7731234567'),
('Envíos del Centro', '7732345678'),
('Paquetería Express', '7733456789');
GO

INSERT INTO Entity ( PostalCode, AddressLine1, AddressLine2)
VALUES
('42800', 'Avenida Universidad 100', 'Colonia Centro'),
('42850', 'Calle Independencia 25', NULL),
('42970', 'Boulevard Industrial 80', 'Local 4'),
('42830', 'Calle Zaragoza 14', 'Colonia San José');
GO

INSERT INTO Customer ( CompanyName, Contact, City, Region, AddressId)
VALUES
('Abarrotes El Sol', 'Juan Pérez', 'Tula de Allende', 'Hidalgo', 1),
('Tienda La Esquina', 'Ana García', 'Tepeji del Río', 'Hidalgo', 2),
('Minisúper Central', 'Luis Martínez', 'Atitalaquia', 'Hidalgo', 3),
('Comercializadora Luna', 'Sofía Ramírez', 'Tlaxcoapan', 'Hidalgo', 4);
GO

INSERT INTO Employee ( FirstName, LastName, Address, ReportsTo)
VALUES
('Roberto', 'Sánchez', 'Tula de Allende, Hidalgo', NULL),
('Laura', 'Hernández', 'Tepeji del Río, Hidalgo', 1),
('Miguel', 'Torres', 'Atitalaquia, Hidalgo', 1),
('Patricia', 'Gómez', 'Tlaxcoapan, Hidalgo', 2);
GO

INSERT INTO Product ( ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, CategoryId,SupplierId)
VALUES
('Agua embotellada', 'Paquete de 12 botellas', 95.00, 50, 1, 1),
('Jugo de naranja', 'Caja de 12 piezas', 180.00, 30, 1, 1),
('Leche entera', 'Caja de 12 litros', 270.00, 25, 2, 2),
('Queso fresco', 'Paquete de 1 kilogramo', 135.00, 20, 2, 2),
('Pan blanco', 'Paquete de 20 piezas', 65.00, 40, 3, 3),
('Galletas de vainilla', 'Caja de 10 paquetes', 110.00, 35, 3, 3),
('Detergente líquido', 'Botella de 2 litros', 85.00, 28, 4, 1),
('Limpiador multiusos', 'Caja de 6 botellas', 210.00, 18, 4, 1);
GO

INSERT INTO Orders (OrderDate, RequiredDate, CustomerId, EmployeeId, ShipperId)
VALUES
('2026-07-20', '2026-07-23', 1, 2, 1),
('2026-07-21', '2026-07-25', 2, 3, 2),
('2026-07-22', '2026-07-26', 3, 2, 1),
('2026-07-23', '2026-07-27', 4, 4, 3),
('2026-07-24', '2026-07-28', 1, 3, 2);
GO
