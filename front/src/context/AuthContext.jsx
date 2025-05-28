import React, { createContext, useState, useEffect, useContext } from 'react';

// 1. Crear el Contexto
export const AuthContext = createContext(null);

// 2. Crear un Hook personalizado para facilitar el uso del contexto
export const useAuth = () => {
    return useContext(AuthContext);
};

// 3. Crear el Proveedor de Autenticación
export const AuthProvider = ({ children }) => {
    // Estado para el usuario autenticado.
    // Inicializamos el estado user con lo que ya esté en localStorage para persistencia.
    const [user, setUser] = useState(() => {
        try {
            const storedUser = localStorage.getItem('user');
            return storedUser ? JSON.parse(storedUser) : null;
        } catch (error) {
            console.error("Error parsing user from localStorage:", error);
            return null;
        }
    });

    // Función para simular el inicio de sesión
    const login = (userData) => {
        setUser(userData);
        // Guardar el objeto de usuario en localStorage (como string JSON)
        localStorage.setItem('user', JSON.stringify(userData));
    };

    // Función para simular el cierre de sesión
    const logout = () => {
        setUser(null);
        // Eliminar el usuario de localStorage
        localStorage.removeItem('user');
    };

    // El valor que se proveerá a todos los componentes hijos
    const authValue = { user, isAuthenticated: !!user, login, logout };

    return (
        <AuthContext.Provider value={authValue}>
            {children}
        </AuthContext.Provider>
    );
};