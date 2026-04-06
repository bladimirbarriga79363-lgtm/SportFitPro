// Definimos el componente del Encabezado (Menú de navegación)
const ComponenteHeader = {
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
                        <li><a href="admin.html">Administración</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    `
};

// Definimos el componente del Pie de Página
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