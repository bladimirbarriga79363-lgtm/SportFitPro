const { Pool } = require('pg');
require('dotenv').config();

// Creamos la plantilla de conexión a la BD
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

pool.on('connect', () => {
    console.log('✅ Conexión establecida con PostgreSQL');
});

module.exports = {
    query: (text, params) => pool.query(text, params),
};