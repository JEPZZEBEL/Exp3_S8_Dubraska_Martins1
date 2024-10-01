

SELECT * FROM costos_ope;

SELECT * FROM  escuela;

SELECT * FROM instalaciones;

SELECT * FROM Personal;

-- insercion de datos --

-- datos costos --

INSERT INTO costos_ope (id_costo, concepto, monto, fecha, id_escuela)
VALUES (1, 'Compra de balones', 50000, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1);
INSERT INTO costos_ope (id_costo, concepto, monto, fecha, id_escuela)
VALUES (2, 'Compra de uniformes', 80000, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 2);
INSERT INTO costos_ope (id_costo, concepto, monto, fecha, id_escuela)
VALUES (3, 'Pago de entrenadores', 120000, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1);
INSERT INTO costos_ope (id_costo, concepto, monto, fecha, id_escuela)
VALUES (4, 'Mantenimiento de la cancha', 150000, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 1);
VALUES (5, 'Compra de equipos de voleibol', 70000, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 4);


-- datos instalacion ---


INSERT INTO instalaciones (id_instalacion, nombre_instalacion, capacidad, direccion, id_escuela)
VALUES (1, 'Estadio Patagonia', 200, 'Calle Estadio 789', 1);
INSERT INTO instalaciones (id_instalacion, nombre_instalacion, capacidad, direccion, id_escuela)
VALUES (2, 'Gimnasio Los Lagos', 150, 'Avenida Gimnasio 123', 2);
INSERT INTO instalaciones (id_instalacion, nombre_instalacion, capacidad, direccion, id_escuela)
VALUES (3, 'Cancha La Frontera', 250, 'Calle La Frontera 567', 1);
INSERT INTO instalaciones (id_instalacion, nombre_instalacion, capacidad, direccion, id_escuela)
VALUES (4, 'Pista Atletismo Patagonia', 300, 'Calle Los Andes 45', 2);
INSERT INTO instalaciones (id_instalacion, nombre_instalacion, capacidad, direccion, id_escuela)
VALUES (5, 'Gimnasio Deportivo Valparaíso', 200, 'Avenida Central 456', 4);


-- Datos personal


VALUES (1, 'Juan Pérez', 'Entrenador', 'Chilena', TO_DATE('1980-06-15', 'YYYY-MM-DD'), 1);
INSERT INTO personal (id_personal, nombre, profesion, nacionalidad, fecha_nacimiento, id_escuela)
VALUES (2, 'Carlos García', 'Preparador Físico', 'Argentina', TO_DATE('1975-04-22', 'YYYY-MM-DD'), 2);
INSERT INTO personal (id_personal, nombre, profesion, nacionalidad, fecha_nacimiento, id_escuela)
VALUES (3, 'Ana López', 'Fisioterapeuta', 'Chilena', TO_DATE('1990-12-05', 'YYYY-MM-DD'), 1);
INSERT INTO personal (id_personal, nombre, profesion, nacionalidad, fecha_nacimiento, id_escuela)
VALUES (4, 'Laura Fernández', 'Preparadora Física', 'Chilena', TO_DATE('1985-03-10', 'YYYY-MM-DD'), 2);
INSERT INTO personal (id_personal, nombre, profesion, nacionalidad, fecha_nacimiento, id_escuela)
VALUES (5, 'María Sánchez', 'Entrenadora', 'Chilena', TO_DATE('1982-07-25', 'YYYY-MM-DD'), 4);
INSERT INTO personal (id_personal, nombre, profesion, nacionalidad, fecha_nacimiento, id_escuela)

--datos escuela

INSERT INTO escuela (id_escuela, nombre, tipo_escuela, direccion, telefono, email, ciudad, region, instalaciones_id_instalacion, personal_id_personal, costos_ope_id_costo)
VALUES (1, 'Escuela de Futbol Patagonia', 'Fútbol', 'Calle 123', '123456789', 'futbol@correo.cl', 'Patagonia', 'Aysén', 1, 1, 1);
INSERT INTO escuela (id_escuela, nombre, tipo_escuela, direccion, telefono, email, ciudad, region, instalaciones_id_instalacion, personal_id_personal, costos_ope_id_costo)
VALUES (2, 'Escuela de Basquet Puerto Montt', 'Básquetbol', 'Avenida Los Lagos 456', '987654321', 'basquet@correo.cl', 'Puerto Montt', 'Los Lagos', 2, 2, 2);
INSERT INTO escuela (id_escuela, nombre, tipo_escuela, direccion, telefono, email, ciudad, region, instalaciones_id_instalacion, personal_id_personal, costos_ope_id_costo)
VALUES (3, 'Escuela de Atletismo Los Andes', 'Atletismo', 'Calle Los Andes 789', '345678912', 'atletismo@correo.cl', 'Los Andes', 'Valparaíso', 4, 4, 4);
INSERT INTO escuela (id_escuela, nombre, tipo_escuela, direccion, telefono, email, ciudad, region, instalaciones_id_instalacion, personal_id_personal, costos_ope_id_costo)
VALUES (4, 'Escuela de Voleibol Valparaíso', 'Voleibol', 'Calle Libertad 345', '987654321', 'voleibol@correo.cl', 'Valparaíso', 'Valparaíso', 5, 5, 5);


-- creacion de auto_incrementar

-- escuela

CREATE SEQUENCE seq_escuela_id
START WITH 1 
INCREMENT BY 1  
NOCACHE;  

CREATE OR REPLACE TRIGGER trg_escuela_id
BEFORE INSERT ON escuela
FOR EACH ROW
BEGIN
  IF :NEW.id_escuela IS NULL THEN
    SELECT seq_escuela_id.NEXTVAL INTO :NEW.id_escuela FROM dual;
  END IF;
END;
/

-- personal

CREATE SEQUENCE seq_personal_id
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER trg_personal_id
BEFORE INSERT ON personal
FOR EACH ROW
BEGIN
  IF :NEW.id_personal IS NULL THEN
    SELECT seq_personal_id.NEXTVAL INTO :NEW.id_personal FROM dual;
  END IF;
END;
/

-- costos_ope
CREATE SEQUENCE seq_costo_id
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER trg_costo_id
BEFORE INSERT ON costos_ope
FOR EACH ROW
BEGIN
  IF :NEW.id_costo IS NULL THEN
    SELECT seq_costo_id.NEXTVAL INTO :NEW.id_costo FROM dual;
  END IF;
END;
/

-- instalaciones

CREATE SEQUENCE seq_instalacion_id
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER trg_instalacion_id
BEFORE INSERT ON instalaciones
FOR EACH ROW
BEGIN
  IF :NEW.id_instalacion IS NULL THEN
    SELECT seq_instalacion_id.NEXTVAL INTO :NEW.id_instalacion FROM dual;
  END IF;
END;
/


INSERT INTO escuela (nombre, tipo_escuela, direccion, telefono, email, ciudad, region, instalaciones_id_instalacion, personal_id_personal, costos_ope_id_costo)
VALUES ('Escuela de Natación TEMUCO', 'Nataciónes', 'Calle falsa 123', '98765433', 'natacion@temuco.cl', 'Temuco', 'Temuco', 1, 1, 1);
