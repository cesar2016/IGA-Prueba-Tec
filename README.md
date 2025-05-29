
- La finalidad de este repositorio es, poder levantar con unos pocos comandos de consola, un stack con lo necesario para trabajar con:
<div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center;">
  <img src="https://chuda.me/wp-content/uploads/2022/09/lampp.jpg" alt="LAMPP" width="200" style="margin: 5px;">
  <img src="https://miro.medium.com/v2/resize:fit:522/0*Hdm7hBTZ-hKlbtlV.png" alt="Node.js" width="200" style="margin: 5px;">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnhfAMgG_6ps9Hs_2NjmJ5pgskwlhFAQyv7g&s" alt="React" width="200" style="margin: 5px;">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJl4fp0SkQbTPU5ZxVl6AKWYuKCwM0gIhNtQ&s" alt="Laravel" width="200" style="margin: 5px;">
</div>

## Intrucciones para levantar el Entorno

# 1 Colonar repositorio desde
    URL: https://github.com/cesar2016/Docker_Laravel_React_MySQL_and_phpmyadmin

# 2 Desde la raiz ejecutar
    sudo docker-compose up -d #levanta todos los contenedores

    // Dentro de api
    cd api && cp .env.example .env #habilita las variables de entorno
    sudo chmod -R 777 bootstrap/
    sudo chmod -R 777 storage/
    php artisan key:generate    

    // Con los contenedores levantados, ejecutar
    docker exec my_1_back composer install

# 3 Ingresar desde el navegador
    Frontend: http://localhost:3001
    Backend: http://localhost:9200/api

    
    phpmyadmin: http://localhost:9300
        user: admin
        password: admin1234


# 4 Datos de accesos al E-Comerce - Login - 
    El login solo esta simulado con el siguiente objeto de usuarios utilizando el localStorage del  Navegador para poder mostrar la viste de usuarios y de administrador

    const simulatedUsers = [
            { id: 6, email: 'admin@admin.com', password: 'admin1234', username: 'Administrador', role: 'admin' }, //
            { id: 3, email: 'test1@test.com', password: 'test1234', username: 'Carlos Rodriguez', role: 'user' }, //
            { id: 4, email: 'test2@test.com', password: 'test1234', username: 'Laura Fernandez', role: 'user' }, //
            { id: 2, email: 'test3@test.com', password: 'test1234', username: 'Maria Garcia', role: 'user' }, //
            { id: 5, email: 'test4@test.com', password: 'test1234', username: 'Pedro Sanchez', role: 'user' }, //
            { id: 1, email: 'test5@test.com', password: 'test1234', username: 'Ro Talu', role: 'user' }, //
    ];

- El proyecto de backend esta generado con composer en laravel 10 y se encuentra en el directorio /api
- El proyecto de frontend esta generado con node.js y React en el directorio /front


## AUTOR
- cesars.pro@gmail.com
- Linkedin: https://www.linkedin.com/in/cesar-sanchez-dev/



        




