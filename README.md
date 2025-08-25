# 🛍️ PR Store

E-commerce básico construido con **Ruby on Rails** y **TailwindCSS**.  
Permite gestionar productos, carritos de compra y usuarios.  

---

## ⚙️ Requisitos

- **Ruby** 3.2+  
- **Rails** 7+  
- **Bundler**  
- **PostgreSQL** (u otra base que tengas configurada en `config/database.yml`)  
- **Node.js** 18+ y **Yarn** (para manejar assets y Tailwind)  

---

## 🚀 Instalación

Clona el proyecto:

```bash
git clone https://github.com/tu-usuario/pr-store.git
cd pr-store
Instala dependencias de Ruby:

bash
Copiar
Editar
bundle install
Instala dependencias de JavaScript:

bash
Copiar
Editar
yarn install
Configura la base de datos:

bash
Copiar
Editar
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed   # opcional, si tienes datos de ejemplo
▶️ Ejecución
Inicia el servidor Rails:

bash
Copiar
Editar
bin/dev
Esto levantará:

Servidor Rails en http://localhost:3000

TailwindCSS en modo watch

🧪 Tests
Ejecuta la suite de tests:

bash
Copiar
Editar
bin/rails test
o si usas RSpec:

bash
Copiar
Editar
bundle exec rspec
📦 Deployment
Para desplegar puedes usar Render o Heroku.
Pasos generales en Render:

Crea un nuevo servicio web.

Selecciona tu repo de GitHub.

Configura el build command:

bash
Copiar
Editar
bundle install && yarn install && bundle exec rails assets:precompile && bundle exec rails db:migrate
Configura el start command:

bash
Copiar
Editar
bundle exec rails server -p 3000 -e production
Añade variables de entorno necesarias (DATABASE_URL, RAILS_MASTER_KEY, etc.).

📝 Notas
Los mensajes de éxito/error se manejan con flash[:notice] y flash[:alert].

El carrito se persiste por usuario (tabla carts y cart_items).

Las imágenes de productos se cargan desde el atributo image_src.

