const express = require('express');
const cors = require('cors');
const db = require('./db');
const bcrypt = require('bcrypt'); // Librería para cifrar contraseñas
require('dotenv').config();

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

// ==========================================
// INICIO DEL SERVIDOR
// ==========================================
app.listen(PORT, () => {
    console.log(`✅ Servidor Full-Stack corriendo en http://localhost:${PORT}`);
});