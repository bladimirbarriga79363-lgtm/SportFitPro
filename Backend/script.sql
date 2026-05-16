--
-- PostgreSQL database dump
--



-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-05-16 12:34:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 47946)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    codigo character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    categoria character varying(50),
    precio numeric(10,2) NOT NULL,
    imagen character varying(255)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 47954)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(20) NOT NULL,
    CONSTRAINT usuarios_rol_check CHECK (((rol)::text = ANY ((ARRAY['cliente'::character varying, 'editor'::character varying, 'admin'::character varying])::text[])))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 47953)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4746 (class 2604 OID 47957)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4899 (class 0 OID 47946)
-- Dependencies: 217
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (codigo, nombre, descripcion, categoria, precio, imagen) FROM stdin;
SUD-001	Sudadera Termal	Ideal para entrenar en invierno.	ropa	950.00	assets/img/productos/sudadera1.jpg
TEN-001	Tenis Velocity X	Amortiguación avanzada para corredores.	calzado	1799.00	assets/img/productos/tenis1.jpg
TEN-003	Tenis Nike Air Zoom Pegasus 39	Amortiguación y respuesta para running diario.	calzado	2600.00	assets/img/productos/tenis003.jpg
TEN-004	Tenis Adidas Ultraboost Light	Máxima comodidad y retorno de energía.	calzado	3200.00	assets/img/productos/tenis004.jpg
TEN-005	Tenis Puma Velocity Nitro 2	Ligereza y estabilidad para correr.	calzado	2400.00	assets/img/productos/tenis005.jpg
TEN-006	Tenis Asics Gel-Kayano Ace 3	Estabilidad y soporte para golf.	calzado	4200.00	assets/img/productos/tenis006.jpg
TEN-007	Tenis New Balance Fresh Foam	Gran amortiguación para largas distancias.	calzado	3400.00	assets/img/productos/tenis007.jpg
TEN-008	Tenis Reebok Nano X3	Estabilidad ideal para entrenamiento y gym.	calzado	2600.00	assets/img/productos/tenis008.jpg
TEN-009	Tenis Nike Free Metcon 4	Flexibilidad y soporte para gym.	calzado	2800.00	assets/img/productos/tenis009.jpg
TEN-010	Tenis Under Armour Curry Flow 10	Ligereza y tracción para baloncesto.	calzado	3500.00	assets/img/productos/tenis010.jpg
TEN-011	Tenis Saucony Endorphin Speed 3	Velocidad y respuesta en running.	calzado	3600.00	assets/img/productos/tenis011.jpg
TEN-012	Tenis Brooks Ghost MAX 3	Amortiguación suave para uso diario.	calzado	3000.00	assets/img/productos/tenis012.jpg
TEN-013	Tenis Mizuno Wave Rider 27	Estabilidad y durabilidad al correr.	calzado	2900.00	assets/img/productos/tenis013.jpg
TEN-014	Tenis Adidas Adizero Adios Pro 3	Alto rendimiento para competencia.	calzado	5000.00	assets/img/productos/tenis014.jpg
TEN-015	Tenis On Cloudmonster 1	Amortiguación y retorno de energía.	calzado	3800.00	assets/img/productos/tenis015.jpg
TEN-016	Tenis Hoka Clifton 10	Ligereza y confort para largas distancias.	calzado	3200.00	assets/img/productos/tenis016.jpg
TEN-017	Tenis Salomon Speedcross 6	Agarre superior para trail running.	calzado	3000.00	assets/img/productos/tenis017.jpg
TEN-018	Tenis Merrell Agility Peak 5	Resistencia y tracción en montaña.	calzado	3100.00	assets/img/productos/tenis018.jpg
TEN-019	Tenis Skechers GOrun Consistent-Aislado	Comodidad para uso diario.	calzado	1800.00	assets/img/productos/tenis019.jpg
TEN-020	Tenis Altra Lone Peak 9	Pisada natural para trail.	calzado	3200.00	assets/img/productos/tenis020.jpg
TEN-021	Tenis Nike Invincible 3	Máxima amortiguación para running.	calzado	3700.00	assets/img/productos/tenis021.jpg
TEN-022	Tenis Adidas Terrex Swift R3	Impermeables y resistentes para senderismo.	calzado	3300.00	assets/img/productos/tenis022.jpg
PLA-002	Playera Nike Dri-FIT Legend	Secado rápido y alta transpirabilidad.	playera	650.00	assets/img/productos/playera002.jpg
PLA-003	Playera Nike Dri-Fit Academy25 SS	Ligera y transpirable para entrenamiento.	playera	700.00	assets/img/productos/playera003.jpg
PLA-004	Playera Nike T-Shirt	Playera básica cómoda para uso diario.	playera	500.00	assets/img/productos/playera004.jpg
PLA-005	Playera Nike Camiseta Park VII	Ideal para deporte con buena ventilación.	playera	550.00	assets/img/productos/playera005.jpg
PLA-006	Playera Nike Team Legend	Comodidad y control de sudor.	playera	650.00	assets/img/productos/playera006.jpg
PLA-007	Playera Nike Dri-FIT Legend	Ligera y fresca para entrenamiento.	playera	650.00	assets/img/productos/playera007.jpg
PLA-008	Playera Nike Legend Dri-Fit 2.0	Mejor ventilación y secado rápido.	playera	700.00	assets/img/productos/playera008.jpg
PLA-009	Playera Adidas Aeroready Designed 2	Control de humedad para entrenamiento.	playera	600.00	assets/img/productos/playera009.jpg
PLA-010	Playera Adidas GM2121	Ligera y cómoda para uso diario.	playera	550.00	assets/img/productos/playera010.jpg
PLA-011	Playera Adidas Own The Run	Diseñada para running.	playera	750.00	assets/img/productos/playera011.jpg
PLA-012	Playera Adidas D4T	Flexible y resistente.	playera	700.00	assets/img/productos/playera012.jpg
PLA-013	Playera Pumas Golden Garra	Diseño oficial cómodo.	playera	800.00	assets/img/productos/playera013.jpg
PLA-014	Playera Puma Teamliga	Transpirable con control de sudor.	playera	600.00	assets/img/productos/playera014.jpg
PLA-015	Playera Puma Teamliga	Cómoda para uso deportivo.	playera	600.00	assets/img/productos/playera015.jpg
PLA-016	Playera Puma Teamliga	Ligera y fresca.	playera	600.00	assets/img/productos/playera016.jpg
PLA-017	Playera Puma Liga Jersey	Ideal para fútbol.	playera	650.00	assets/img/productos/playera017.jpg
PLA-018	Camiseta Under Armour Tech 2.0	Secado rápido y ligera.	playera	700.00	assets/img/productos/playera018.jpg
PLA-019	Playera Under Armour UA Tech 2.0	Transpirable para uso diario.	playera	700.00	assets/img/productos/playera019.jpg
PLA-020	Camiseta Under Armour Sportstyle Left Chest	Estilo casual y cómodo.	playera	600.00	assets/img/productos/playera020.jpg
PLA-021	Playera Under Armour Tech tee	Alto rendimiento y confort.	playera	750.00	assets/img/productos/playera022.jpg
SHO-002	Short Nike Little Girls Dri-FIT	Ligero y fresco para uso diario.	short	480.00	assets/img/productos/short002.jpg
SHO-003	Short Nike Dri-FIT Academy	Transpirable para fútbol y entrenamiento.	short	649.00	assets/img/productos/short003.jpg
SHO-004	Short Nike Dri-FIT Academy Pro Soccer	Diseñado para alto rendimiento en cancha.	short	749.00	assets/img/productos/short004.jpg
SHO-005	Short Nike Dri-Fit Flex	Elasticidad y libertad de movimiento.	short	799.00	assets/img/productos/short005.jpg
SHO-006	Short Nike Dri-FIT Icon	Ligero y cómodo para entrenamiento.	short	699.00	assets/img/productos/short006.jpg
SHO-007	Short Adidas Tiro 23	Ajuste cómodo para fútbol.	short	799.00	assets/img/productos/short007.jpg
SHO-008	Short Adidas Own The Run	Ligero para running.	short	699.00	assets/img/productos/short008.jpg
SHO-009	Short Adidas Entrada 22	Resistente para uso deportivo.	short	549.00	assets/img/productos/short009.jpg
TEN-002	Tenis Running x	Comodidad avanzada para corredores.	calzado	1999.00	assets/img/productos/tenis002.jpg
PLA-001	Playera TechFit 	Tecnología de secado rápido.	playera	450.00	assets/img/productos/playera1.jpg
SHO-010	Short Adidas Entrada 22	Comodidad y ligereza diaria.	short	549.00	assets/img/productos/short010.jpg
SHO-011	Short Under Armour Raid 2.0	Resistente para entrenamiento intenso.	short	799.00	assets/img/productos/short011.jpg
SHO-012	Short Under Armour UA Prototype 2.0	Ligero y transpirable.	short	699.00	assets/img/productos/short012.jpg
SHO-013	Short Under Armour UA Raid 2.0	Frescura para ejercicio diario.	short	799.00	assets/img/productos/short013.jpg
SHO-014	Short Under Armour Raid Pocketed	Comodidad con bolsillos.	short	849.00	assets/img/productos/short014.jpg
SHO-015	Short Under Armour UA Launch Elite	Alto rendimiento para running.	short	999.00	assets/img/productos/short015.jpg
SHO-016	Short Under Armour Loose Fit	Ajuste relajado y cómodo.	short	649.00	assets/img/productos/short016.jpg
SHO-017	Short Under Armour Launch 5	Ligero para correr.	short	949.00	assets/img/productos/short017.jpg
SHO-018	Short ASICS Tenis 2-N-1	Comodidad y soporte en movimiento.	short	899.00	assets/img/productos/short018.jpg
SHO-019	Short ASICS Rival II 1/2 Split	Ligero para running competitivo.	short	799.00	assets/img/productos/short019.jpg
SHO-020	Short ASICS Intensity 1/2 Split	Diseño ligero para entrenamiento.	short	749.00	assets/img/productos/short020.jpg
SHO-021	Short Reebok Crossfit	Resistencia para entrenamiento funcional.	short	899.00	assets/img/productos/short021.jpg
SUD-002	Sudadera Nike Sportswear Club Full Zip Fleece	Abrigo cálido y cómodo diario.	sudadera	1499.00	assets/img/productos/sudadera002.jpg
SUD-003	Sudadera Nike Sportswear Club Full Zip Fleece	Sudadera fleece cómoda y abrigadora.	sudadera	1499.00	assets/img/productos/sudadera003.jpg
SUD-004	Sudadera Nike Sportswear Club Full Zip Fleece	Uso diario con buen abrigo.	sudadera	1499.00	assets/img/productos/sudadera004.jpg
SUD-005	Sudadera Nike Sportswear Club Fleece Herren-rundhalsshirt	Fleece cálido estilo casual.	sudadera	1299.00	assets/img/productos/sudadera005.jpg
SUD-006	Sudadera Nike Dri-fit Academy Pro 24 Track Jacket K	Ligera y transpirable para entrenamiento.	sudadera	1399.00	assets/img/productos/sudadera006.jpg
SUD-007	Sudadera Nike Dri-fit Academy 25 Track	Ideal para entrenamiento en clima fresco.	sudadera	1399.00	assets/img/productos/sudadera007.jpg
SUD-008	Sudadera Nike Dri-fit Academy Mv	Ligera con control de sudor.	sudadera	1299.00	assets/img/productos/sudadera008.jpg
SUD-009	Sudadera Nike Longsleeve Academy Pro	Manga larga para entrenamiento.	sudadera	1199.00	assets/img/productos/sudadera009.jpg
SUD-010	Sudadera Adidas Essentials 3-Stripes Pullover	Clásica y cómoda para uso diario.	sudadera	1199.00	assets/img/productos/sudadera010.jpg
SUD-011	Sudadera Adidas Essentials Warm-up	Ligera para calentamiento deportivo.	sudadera	999.00	assets/img/productos/sudadera011.jpg
SUD-012	Sudadera Adidas Tiro23 League	Diseñada para fútbol y entrenamiento.	sudadera	1299.00	assets/img/productos/sudadera012.jpg
SUD-013	Sudadera Adidas Train to Peak HIIT Training	Transpirable para entrenamiento intenso.	sudadera	1399.00	assets/img/productos/sudadera013.jpg
SUD-014	Sudadera Adidas Aeroready	Control de humedad y confort.	sudadera	1199.00	assets/img/productos/sudadera014.jpg
SUD-015	Sudadera Adidas Stadium Aeroready	Comodidad deportiva con ventilación.	sudadera	1399.00	assets/img/productos/sudadera015.jpg
SUD-016	Sudadera Adidas TIRO21	Estilo fútbol con ajuste cómodo.	sudadera	1299.00	assets/img/productos/sudadera016.jpg
SUD-017	Sudadera Puma IndividualLIGA 1/4 Zip Top	Ligera para entrenamiento deportivo.	sudadera	999.00	assets/img/productos/sudadera017.jpg
SUD-018	Sudadera Puma IndividualLIGA 1/4 Zip Top	Comodidad para uso diario.	sudadera	999.00	assets/img/productos/sudadera018.jpg
SUD-019	Sudadera Puma Fit Full Zip Dk B	Entrenamiento con ajuste cómodo.	sudadera	1199.00	assets/img/productos/sudadera019.jpg
SUD-020	Sudadera Puma EvoStripe	Diseño moderno y flexible.	sudadera	1399.00	assets/img/productos/sudadera020.jpg
SUD-021	Sudadera Puma TeamRISE	Básica deportiva para entrenamiento.	sudadera	899.00	assets/img/productos/sudadera021.jpg
PAN-001	Pants Nike Jogger Sweatpants	Jogger cómodo para uso diario.	pants	1199.00	assets/img/productos/pans002.jpg
PAN-002	Pants Nike Sportswear Club Fleece	Fleece cálido y cómodo diario.	pants	1399.00	assets/img/productos/pans003.jpg
PAN-003	Pants Nike Sporty	Ligero y cómodo casual.	pants	999.00	assets/img/productos/pans004.jpg
PAN-004	Pants Nike Sporty	Uso deportivo con buen ajuste.	pants	999.00	assets/img/productos/pans005.jpg
PAN-005	Pants Nike Club Herren-velourshose	Velour suave y abrigador.	pants	1499.00	assets/img/productos/pans006.jpg
PAN-006	Pants Nike M NSW Club JGGR BB Sweat	Jogger fleece cómodo y ajustado.	pants	1399.00	assets/img/productos/pans007.jpg
PAN-007	Pants Nike M Nk Club FLC	Fleece cálido para diario.	pants	1299.00	assets/img/productos/pans008.jpg
PAN-008	Pants Nike M Nk Club FLC	Abrigo ligero y cómodo.	pants	1299.00	assets/img/productos/pans009.jpg
PAN-009	Pants Nike M Nk Club FLC	Comodidad para uso diario.	pants	1299.00	assets/img/productos/pans010.jpg
PAN-010	Pants Nike Sport	Movimiento libre para entrenamiento.	pants	1099.00	assets/img/productos/pans011.jpg
PAN-011	Pants Nike Sport	Diseño deportivo resistente.	pants	1099.00	assets/img/productos/pans012.jpg
PAN-012	Pants Nike Sport	Estilo casual y cómodo.	pants	1099.00	assets/img/productos/pans013.jpg
PAN-013	Pants Nike Club Basket Ball	Corte amplio para básquetbol.	pants	1199.00	assets/img/productos/pans014.jpg
PAN-014	Pants Adidas Essentials	Comodidad básica para diario.	pants	999.00	assets/img/productos/pans015.jpg
PAN-015	Pants Adidas Medias Essentials	Ajuste cómodo y ligero.	pants	899.00	assets/img/productos/pans016.jpg
PAN-016	Pants Adidas Sereno Cut 3 Rayas	Diseño fútbol con ajuste slim.	pants	1099.00	assets/img/productos/pans017.jpg
PAN-017	Pants Adidas Essentials	Uso diario con comodidad.	pants	999.00	assets/img/productos/pans018.jpg
PAN-018	Pants Under Armour UA Rival Fleece	Fleece cálido y deportivo.	pants	1199.00	assets/img/productos/pans019.jpg
PAN-019	Pants Under Armour UA Rival Fleece	Comodidad para entrenamiento diario.	pants	1199.00	assets/img/productos/pans020.jpg
PAN-020	Pants Under Armour Rival Fleece	Durabilidad y confort deportivo.	pants	1199.00	assets/img/productos/pans021.jpg
PAN-021	Pants Under Armour White Comforts	Comodidad y confort deportivo.	pants	1299.00	assets/img/productos/pans022.jpg
SHO-001	Short Flex Pro	Movilidad total para sus entrenamientos	short	599.00	assets/img/productos/short1.jpg
PAN-025	PANTS	PANTS DEPORTIVO	pants	500.00	assets/img/productos/pans012.jpg
\.


--
-- TOC entry 4901 (class 0 OID 47954)
-- Dependencies: 219
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, email, password, rol) FROM stdin;
2	Bladimir Barriga	bladi@prueba.com	$2b$10$hAsVm.d.gUJcGTfDVKqBEeMJF1PCkuugYg2lppSkJ.f7aI2vlgaAW	admin
6	Yahir Reyna	yahir1@ejemplo.com	$2b$10$kqMYhMN1jTrfFFnWMcVi7.hIT.lhWYSnMedZNt/n7n5zPBW0ykqzK	cliente
7	Justin Damian	jus@prueba.com	$2b$10$YOyLmo9UfHWRMFkYfxyQTuu6xU9WNJ7QMr6NUD6IrDZaLTVbRROni	cliente
9	Reyna 	carlosyahirreynasandoval@gmail.com	$2b$10$J6.O7IxQIN92dqp9lo8D8.P18ow192mOzOk4ShVywwFAW3.h2vWg2	cliente
\.


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 218
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 9, true);


--
-- TOC entry 4749 (class 2606 OID 47952)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (codigo);


--
-- TOC entry 4751 (class 2606 OID 47962)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 4753 (class 2606 OID 47960)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


-- Completed on 2026-05-16 12:34:50

--
-- PostgreSQL database dump complete
--
