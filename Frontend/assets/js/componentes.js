// Definimos el componente del Encabezado (Menú de navegación)
// Definimos el componente del Encabezado (Ahora inteligente)
const ComponenteHeader = {
    // 1. Leemos si hay alguien logueado al cargar la página
    data() {
        return {
            usuario: JSON.parse(localStorage.getItem('sesionSportFit')) || null
        }
    },
    // 2. Método para borrar la sesión y regresar al inicio
    methods: {
        cerrarSesion() {
            localStorage.removeItem('sesionSportFit');
            window.location.href = 'index.html';
        }
    },
    template: `
        <header>
            <div class="navbar">
                <div class="logo"><img src="assets/img/logo.png" alt="SportFit Pro Logo"></div>
                <nav>
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="catalogo.html">Catálogo</a></li>
                        <li><a href="mision.html">Misión</a></li>
                        <li><a href="vision.html">Visión</a></li>
                        <li><a href="contacto.html">Contacto</a></li>
                        
                    
                        <!-- NUEVO: Botón de carrito (Solo visible si hay sesión) -->
                        <li v-if="usuario">
                        <a href="carrito.html">🛒 Mi Carrito</a>
                        </li>
                    
                        <!-- Solo mostramos 'Administración' si el rol es admin -->
                        <li v-if="usuario && usuario.rol === 'admin'">
                            <a href="admin.html">Administración</a>
                        </li>

                        <li v-if="!usuario">
                            <a href="login.html" style="font-weight: bold; color: #ff9800;">Entrar</a>
                        </li>
                        
                        <li v-else>
                            <a href="#" @click.prevent="cerrarSesion" style="font-weight: bold; color: #ff5722;">
                                Salir ({{ usuario.nombre }})
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
    `
};

// Definimos el componente del Pie de Página (Exactamente como lo tenías)
const ComponenteFooter = {
    template: `
        <footer>
            <p>SportFit Pro - Tu estilo, tu ritmo.</p>
            <div style="display: flex; justify-content: center; gap: 15px; margin-top: 10px;">
                <a href="https://validator.w3.org/">
                    <img style="border:0;width:88px;height:31px; margin-top: 16px;" src="https://www.w3.org/Icons/valid-html401-blue" alt="¡HTML Válido!">
                </a>
                <a href="https://jigsaw.w3.org/css-validator/">
                    <img style="border:0;width:88px;height:31px; margin-top: 16px;" src="https://jigsaw.w3.org/css-validator/images/vcss-blue" alt="¡CSS Válido!">
                </a>
            </div>
        </footer>
    `
};