const express = require('express');
const cors = require('cors');
const db = require('./db');
const bcrypt = require('bcrypt'); // Librería para cifrar contraseñas
require('dotenv').config();
// --- NUEVO PARA EL PASO 4 (HTTPS) ---
const https = require('https');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(cors());
app.use(express.json());



// MÓDULO DE USUARIOS Y ROLES (PASO 2)


// 1. POST: Registrar un nuevo usuario (con contraseña cifrada)
app.post('/api/usuarios', async (req, res) => {
    const { nombre, email, password, rol } = req.body;
    try {
        // Ciframos la contraseña usando bcrypt
        const saltRounds = 10;
        const hashedPassword = await bcrypt.hash(password, saltRounds);

        // Guardamos en la base de datos de forma segura
        const nuevoUsuario = await db.query(
            'INSERT INTO usuarios (nombre, email, password, rol) VALUES ($1, $2, $3, $4) RETURNING id, nombre, email, rol',
            [nombre, email, hashedPassword, rol]
        );
        res.status(201).json(nuevoUsuario.rows[0]);
    } catch (error) {
        console.error("Error en registro:", error);
        res.status(500).json({ error: 'Error al registrar usuario. Verifica que el correo no esté repetido.' });
    }
});

// 2. GET: Obtener todos los usuarios (para que el Admin los vea)
app.get('/api/usuarios', async (req, res) => {
    try {
        const { rows } = await db.query('SELECT id, nombre, email, rol FROM usuarios ORDER BY id ASC');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener usuarios' });
    }
});

// 3. DELETE: Eliminar un usuario por su ID
app.delete('/api/usuarios/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await db.query('DELETE FROM usuarios WHERE id = $1', [id]);
        res.json({ mensaje: 'Usuario eliminado correctamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al eliminar usuario' });
    }
});


// MÓDULO DE PRODUCTOS (PASO 1)


// GET: Obtener el catálogo de productos
app.get('/api/productos', async (req, res) => {
    try {
        const { rows } = await db.query('SELECT * FROM productos');
        res.json(rows);
    } catch (error) {
        console.error('Error al obtener productos:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

// POST: Agregar un nuevo producto desde el panel de admin
app.post('/api/productos', async (req, res) => {
    const { codigo, nombre, descripcion, categoria, precio, imagen } = req.body;
    try {
        const result = await db.query(
            'INSERT INTO productos (codigo, nombre, descripcion, categoria, precio, imagen) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
            [codigo, nombre, descripcion, categoria, precio, imagen]
        );
        res.status(201).json(result.rows[0]);
    } catch (error) {
        console.error("Error al registrar producto:", error);
        res.status(500).json({ error: 'Error al guardar el producto. Verifica que el código no esté repetido.' });
    }
});

// DELETE: Eliminar un producto por su código
app.delete('/api/productos/:codigo', async (req, res) => {
    const { codigo } = req.params;
    try {
        await db.query('DELETE FROM productos WHERE codigo = $1', [codigo]);
        res.json({ mensaje: 'Producto eliminado correctamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al eliminar producto' });
    }
});

// ==========================================
// PASO 3: SESIONES, AJAX Y ACTUALIZACIÓN
// ==========================================

// 1. LOGIN (Para conservar sesiones)
app.post('/api/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await db.query('SELECT * FROM usuarios WHERE email = $1', [email]);
        if (user.rows.length === 0) return res.status(401).json({ error: 'Usuario no encontrado' });

        // Comparamos la contraseña en texto plano con el Hash de la BD
        const validPassword = await bcrypt.compare(password, user.rows[0].password);
        if (!validPassword) return res.status(401).json({ error: 'Contraseña incorrecta' });

        // Si es válido, enviamos los datos básicos para la sesión del navegador
        res.json({ id: user.rows[0].id, nombre: user.rows[0].nombre, rol: user.rows[0].rol });
    } catch (error) {
        res.status(500).json({ error: 'Error en el servidor' });
    }
});

// 2. ACTUALIZAR PRODUCTO (El requisito de "Actualizar la información en la BD")
app.put('/api/productos/:codigoViejo', async (req, res) => {
    const { codigoViejo } = req.params;
    const { codigo, nombre, descripcion, categoria, precio, imagen } = req.body;
    try {
        await db.query(
            'UPDATE productos SET codigo = $1, nombre = $2, descripcion = $3, categoria = $4, precio = $5, imagen = $6 WHERE codigo = $7',
            [codigo, nombre, descripcion, categoria, precio, imagen, codigoViejo]
        );
        res.json({ mensaje: 'Producto actualizado correctamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al actualizar producto' });
    }
});

// 3. VALIDACIÓN AJAX EN TIEMPO REAL (Requisito "Usar AJAX para ID de Producto")
app.get('/api/check-producto/:codigo', async (req, res) => {
    const { codigo } = req.params;
    try {
        const result = await db.query('SELECT codigo FROM productos WHERE codigo = $1', [codigo]);
        // Si length > 0, el código ya existe
        res.json({ existe: result.rows.length > 0 }); 
    } catch (error) {
        res.status(500).json({ error: 'Error AJAX' });
    }
});

// ==========================================
// PASO 4: CONFIGURACIÓN DE SERVIDOR HTTPS
// ==========================================

// Leemos las llaves que generaste con OpenSSL
const opcionesHTTPS = {
    key: fs.readFileSync(path.join(__dirname, 'key.pem')),
    cert: fs.readFileSync(path.join(__dirname, 'cert.pem'))
};

// Levantamos el servidor en modo seguro

https.createServer(opcionesHTTPS, app).listen(PORT, () => {
    console.log(`🚀 Servidor SEGURO corriendo en: https://localhost:${PORT}`);
});