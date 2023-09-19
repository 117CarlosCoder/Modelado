    DROP DATABASE IF EXISTS tienda_database;

    CREATE DATABASE tienda_database;
    USE tienda_database;

    CREATE TABLE admin(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        username VARCHAR(25) NOT NULL,
        password VARCHAR(40) NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE usuarioTienda(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        tienda INT NOT NULL,
        username VARCHAR(25) NOT NULL,
        password VARCHAR(40) NOT NULL,
        email VARCHAR(40) NOT NULL,
        tipoTienda VARCHAR(40) NOT NULL,
        suspension boolean NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE usuarioBodega(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        username VARCHAR(25) NOT NULL,
        password VARCHAR(40) NOT NULL,
        email VARCHAR(40) NOT NULL,
        suspension boolean NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE supervisor(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        username VARCHAR(25) NOT NULL,
        password VARCHAR(40) NOT NULL,
        email VARCHAR(40) NOT NULL,
        suspension boolean NOT NULL,
        PRIMARY KEY(codigo)
        );

    CREATE TABLE pedidos(
        codigo INT NOT NULL AUTO_INCREMENT,
        tienda INT NOT NULL,
        usuario INT NOT NULL,
        fecha DATE NOT NULL,
        total DECIMAL NOT NULL,
        estado VARCHAR(40) NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE detalleProducto(
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoProducto INT NOT NULL,
        codigoPedido INT NOT NULL,
        precioProducto DECIMAL NOT NULL,
        nombreProducto VARCHAR(40) NOT NULL,
        cantidadProducto INT NOT NULL,
        FOREIGN KEY (codigoPedido) REFERENCES pedidos(codigo),
        PRIMARY KEY(codigo)
        
    );

    CREATE TABLE incidencia(
        codigo INT NOT NULL AUTO_INCREMENT,
        tienda INT NOT NULL,
        usuario INT NOT NULL,   
        fecha DATE NOT NULL,
        detalle VARCHAR(40) NOT NULL,
        estado VARCHAR(40) NOT NULL,
        PRIMARY KEY(codigo)
        
    );

    CREATE TABLE compraProductos(
        codigo INT NOT NULL AUTO_INCREMENT,
        total DECIMAL NOT NULL,
        usuario INT NOT NULL,   
        fecha DATE NOT NULL,
        cantidadProducto INT NOT NULL,
        PRIMARY KEY(codigo)
        
    );


    CREATE TABLE catalogoGeneral(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombreProducto VARCHAR(40) NOT NULL,
        costo DECIMAL NOT NULL,
        precio DECIMAL NOT NULL,
        existencias INT NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE catalogoTienda(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombreProducto VARCHAR(40) NOT NULL,
        codigoTienda INT NOT NULL,
        codigoProducto INT NOT NULL,
        existenciasTienda INT NOT NULL,
        costo DECIMAL NOT NULL,
        precio DECIMAL NOT NULL,
        FOREIGN KEY (codigoProducto) REFERENCES catalogoGeneral(codigo),
        PRIMARY KEY (codigo)
    );

    CREATE TABLE tiendas(
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoTienda INT NOT NULL,
        codigoUsuariobodega INT NOT NULL,
        FOREIGN KEY (codigoUsuariobodega) REFERENCES usuarioBodega(codigo),
        PRIMARY KEY(codigo)
    );


    CREATE TABLE devolucion(
        codigo INT NOT NULL AUTO_INCREMENT,
        tienda INT NOT NULL,
        usuario INT NOT NULL,
        fecha DATE NOT NULL,
        total DECIMAL NOT NULL,       
        PRIMARY KEY(codigo)
        
    );

    CREATE TABLE proveedores(
        codigo INT NOT NULL AUTO_INCREMENT,
        numero INT NOT NULL,
        direccion VARCHAR(25) NOT NULL,  
        PRIMARY KEY(codigo)
        
    );

    CREATE TABLE productos(
        codigo INT NOT NULL AUTO_INCREMENT,
        nombreProducto VARCHAR(40) NOT NULL,
        codigoProducto INT NOT NULL,
        costo DECIMAL NOT NULL,
        existencias INT NOT NULL,  
        PRIMARY KEY(codigo)
    );

    CREATE TABLE parametros(
        codigo INT NOT NULL AUTO_INCREMENT,
        limiteProductos INT NOT NULL,
        limiteTotal INT NOT NULL, 
        PRIMARY KEY(codigo)        
    );

