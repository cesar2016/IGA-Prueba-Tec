import React, { useContext } from 'react';
import { Link, Outlet, useNavigate } from 'react-router-dom';
import { CourseContext } from '../context/CourseContext';
import { useAuth } from '../context/AuthContext'; // ¡Importa useAuth!
import logo from '../assets/Pokédex_logo.png' // Si no usas este logo, puedes eliminarlo

export const Navigation = () => {
    const { onInputChange, valueSearch, onResetForm } =
        useContext(CourseContext);

    const navigate = useNavigate();
    // Obtén la función logout Y el objeto 'user' del contexto de autenticación
    const { logout, user } = useAuth(); 

    const onSearchSubmit = e => {
        e.preventDefault();
        navigate('/search', {
            state: valueSearch,
        });

        onResetForm();
    };

    // Función para manejar el logout
    const handleLogout = () => {
        logout(); // Llama a la función logout del AuthContext
        navigate('/'); // Redirige a la página de inicio (que ahora es el login) después de cerrar sesión
    };

    return (
        <>
            <header className='container'>
                <Link to='/' className='logo'>
                    <img
                        src='https://iga-la.com/images/logo.png'
                        alt='Logo'
                    />
                </Link>

                <form onSubmit={onSearchSubmit}>
                    <div className='form-group'>
                        <svg
                            xmlns='http://www.w3.org/2000/svg'
                            fill='none'
                            viewBox='0 0 24 24'
                            strokeWidth='1.5'
                            stroke='currentColor'
                            className='icon-search'
                        >
                            <path
                                strokeLinecap='round'
                                strokeLinejoin='round'
                                d='M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z'
                            />
                        </svg>
                        <input
                            type='search'
                            name='valueSearch'
                            id=''
                            value={valueSearch}
                            onChange={onInputChange}
                            placeholder='Buscar nombre de curso'
                        />
                    </div>

                    <button className='btn-search'>Buscar</button>
                </form>

                {/* Contenedor para el botón y el saludo */}
                <div style={{ marginLeft: 'auto', textAlign: 'right' }}> 
                    <button
                        onClick={handleLogout}
                        className='btn btn-danger'  
                         
                    >
                        <i className='fa fa-sign-out'></i> Cerrar Sesión
                    </button>

                    {/* Mostrar "Hola! (Nombre del usuario logueado)" solo si hay un usuario */}
                    {user && ( // Verifica si 'user' existe (está logueado)
                        <small style={{ display: 'block', marginTop: '5px', color: '#6c757d' }}> 
                            ¡Hola! {user.username || user.email} {/* Muestra el username o el email si no hay username */}
                        </small>
                    )}
                </div>

            </header>

            <Outlet />
        </>
    );
};