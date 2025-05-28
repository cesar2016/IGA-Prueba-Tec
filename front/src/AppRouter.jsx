import React from 'react';
import { Navigate, Route, Routes } from 'react-router-dom';
import { Navigation } from './components/Navigation';

import { AuthProvider, useAuth } from './context/AuthContext'; 

import { HomePage, IgaCourses, SearchPage, MyCourses, AdminCourses, Login } from './pages';

// Componente para proteger rutas
const PrivateRoute = ({ children }) => {
    const { isAuthenticated } = useAuth(); 
    return isAuthenticated ? children : <Navigate to="/login" replace />;
};

export const AppRouter = () => {
    return (
        <AuthProvider>
            <Routes>
                {/* Ruta de Login: Es la página de inicio, no necesita protección */}
                <Route path='/' element={<Login />} /> 

                {/* Grupo de Rutas Protegidas bajo /Nav */}
                {/* Todas las rutas anidadas dentro de este Route estarán protegidas por PrivateRoute */}
                <Route path='/nav' element={<PrivateRoute><Navigation /></PrivateRoute>}>    
                    <Route index element={<HomePage />} /> {/* /Nav */}
                    <Route path='course/:id' element={<IgaCourses />} /> {/* /Nav/course/:id */}
                    <Route path='my_courses/:id' element={<MyCourses />} /> {/* /Nav/my_courses/:id */}
                    <Route path='admin_courses' element={<AdminCourses />} /> {/* /Nav/admin_courses */}
                    <Route path='search' element={<SearchPage />} /> {/* /Nav/search */}
                </Route>

                {/* Ruta comodín para cualquier otra URL no definida */}
                {/* Redirige a la ruta raíz (que ahora es el login) */}
                <Route path='*' element={<Navigate to='/' />} /> 
            </Routes>
        </AuthProvider>
    );
};