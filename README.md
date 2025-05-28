
- La finalidad de este repositorio es, poder levantar con unos pocos comandos de consola, un stack con lo necesario para trabajar con:
# React | Laravel | MySQL | PhpMyadmin | Server Apache

## Intrucciones para levantar el Entorno

# 1 colonar repositorio desde
    URL: https://github.com/cesar2016/Docker_Laravel_React_MySQL_and_phpmyadmin

# 2 desde la raiz ejecutar
    docker-compose up -d     #levanta todos los contenedores

    // Dentro de api
    cd api && cp .env.example .env #habilita las variables de entorno
    sudo chmod -R 777 bootstrap/
    sudo chmod -R 777 storage/
    php artisan key:generate
    docker exec my_1_back sh -c "composer install && php artisan migrate" #Dependencias y migraciones

# 3 Ingresar desde el navegador
    Frontend: http://localhost:3001
    backend: http://localhost:8200

    
    phpmyadmin: http://localhost:8300
        user: admin
        password: admin1234


# 3 Ingresar desde el navegador
    El login solo esta simulado con el siguiente objeto de usuarios utilizando el localStorage del  Navegador para poder mostrar la viste de usuarios y de administrador

    const simulatedUsers = [
            { id: 6, email: 'admin@admin.com', password: 'admin1234', username: 'Administrador', role: 'admin' }, //
            { id: 3, email: 'test1@test.com', password: 'test1234', username: 'Carlos Rodriguez', role: 'user' }, //
            { id: 4, email: 'test2@test.com', password: 'test1234', username: 'Laura Fernandez', role: 'user' }, //
            { id: 2, email: 'test3@test.com', password: 'test1234', username: 'Maria Garcia', role: 'user' }, //
            { id: 5, email: 'test4@test.com', password: 'test1234', username: 'Pedro Sanchez', role: 'user' }, //
            { id: 1, email: 'test5@test.com', password: 'test1234', username: 'Ro Talu', role: 'user' }, //
    ];

- El proyecto de backend esta generado con composer en laravel-lumen y se encuentra en /api
- El proyecto de frontend esta generado con node.js y React en /front



## AUTOR
- cesars.pro@gmail.com
- Linkedin: https://www.linkedin.com/in/cesar-sanchez-dev/



        





