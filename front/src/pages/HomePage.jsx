import React, { useContext } from 'react';
import { FilterBar, CoursesList } from '../components';
import { CourseContext } from '../context/CourseContext';
import { useAuth } from '../context/AuthContext'; // ¡Importa useAuth!

import { Link } from 'react-router-dom';

export const HomePage = () => {
    const { onClickLoadMore, active, setActive } = useContext(CourseContext);
    const { user } = useAuth(); // Obtén el objeto 'user' del AuthContext

    // Verifica si el usuario logueado es administrador
    // Asumimos que 'admin@admin.com' tiene el rol de 'admin' o puedes verificar directamente el email
    const isAdmin = user && (user.role === 'admin' || user.email === 'admin@admin.com'); 
    // user.id === 6 si confías en el ID específico del admin como en tu tabla

    return (
        <>
            <div className='container-filter container'>
                <div className='icon-filter'> 
                    {isAdmin ? (
                        // Si es administrador, mostrar el botón de ADMIN
                        <Link to="admin_courses" className="btn btn-success d-flex align-items-center">                    
                            <i className='fa fa-user m-2'></i>  ADMIN
                        </Link>
                    ) : (
                        // Si no es administrador (usuario regular), mostrar el botón de Mis Cursos
                        // Usamos user.id para construir la URL dinámicamente
                        <Link to={`my_courses/${user ? user.id : ''}`} className="btn btn-primary d-flex align-items-center">                 
                            <i className='fa fa-book m-2'> Mis cursos</i>    
                        </Link>
                    )}
                     
                </div>
            </div>
            <CoursesList />
            <FilterBar />
            <div className="container-btn-load-more container">
                <button className='btn-load-more' onClick={onClickLoadMore}>
                    Cargar más
                </button>
            </div>
        </>
    );
};