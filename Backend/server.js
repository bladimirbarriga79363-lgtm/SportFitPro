const express = require('express');
const cors = require('cors');
const db = require('./db'); // Importamos tu plantilla de conexión
const bcrypt = require('bcrypt');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
const app = express();
app.use(cors()); // Permite que tu HTML se comunique con este servidor
app.use(express.json());

// Ruta de prueba
app.get('/', (req, res) => {
    res.send('Servidor de SportFit Pro funcionando 🚀');
});

// Ruta para obtener todos los productos (Paso 1 de la rúbrica)
app.get('/api/productos', async (req, res) => {
    try {
        const { rows } = await db.query('SELECT * FROM productos');
        res.json(rows);
    } catch (error) {
        console.error('Error al obtener productos:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

// --- MÓDULO DE USUARIOS (PASO 2) ---

// 1. REGISTRAR USUARIO (Con cifrado)
app.post('/api/usuarios', async (req, res) => {
    const { nombre, email, password, rol } = req.body;
    try {
        // Ciframos la contraseña antes de guardar 
        const saltRounds = 10;
        const hashedPassword = await bcrypt.hash(password, saltRounds);

        const nuevoUsuario = await db.query(
            'INSERT INTO usuarios (nombre, email, password, rol) VALUES ($1, $2, $3, $4) RETURNING id, nombre, email, rol',
            [nombre, email, hashedPassword, rol]
        );
        res.status(201).json(nuevoUsuario.rows[0]);
    } catch (error) {
        res.status(500).json({ error: 'Error al registrar usuario' });
    }
});

// 2. OBTENER USUARIOS (Para gestión del admin)
app.get('/api/usuarios', async (req, res) => {
    try {
        const { rows } = await db.query('SELECT id, nombre, email, rol FROM usuarios');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener usuarios' });
    }
});

// 3. ELIMINAR USUARIO 
app.delete('/api/usuarios/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await db.query('DELETE FROM usuarios WHERE id = $1', [id]);
        res.json({ mensaje: 'Usuario eliminado correctamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al eliminar' });
    }
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});