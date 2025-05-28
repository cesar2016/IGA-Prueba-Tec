import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext'; // Importar el hook de autenticación

export const Login = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const { login, isAuthenticated } = useAuth(); // Obtener funciones y estado del contexto
    const navigate = useNavigate(); // Hook para navegar programáticamente

    // Efecto para redirigir si el usuario ya está autenticado
    useEffect(() => {
        if (isAuthenticated) {
            // Si ya está autenticado, redirigir a /Nav
            navigate('/nav', { replace: true });
        }
    }, [isAuthenticated, navigate]);

    const handleSubmit = (e) => {
        e.preventDefault();
        setError(''); // Limpiar errores anteriores

        // --- SIMULACIÓN DE LOGIN CON USUARIOS Y CONTRASEÑAS ESPECÍFICAS ---
        let userData = null;

        // Lista de usuarios simulados con TODOS los datos disponibles
        // Puedes añadir más campos aquí si los tienes en tu DB real (ej. 'name', 'address', 'phone', etc.)
        const simulatedUsers = [
            { id: 6, email: 'admin@admin.com', password: 'admin1234', username: 'Administrador', role: 'admin' }, //
            { id: 3, email: 'test1@test.com', password: 'test1234', username: 'Carlos Rodriguez', role: 'user' }, //
            { id: 4, email: 'test2@test.com', password: 'test1234', username: 'Laura Fernandez', role: 'user' }, //
            { id: 2, email: 'test3@test.com', password: 'test1234', username: 'Maria Garcia', role: 'user' }, //
            { id: 5, email: 'test4@test.com', password: 'test1234', username: 'Pedro Sanchez', role: 'user' }, //
            { id: 1, email: 'test5@test.com', password: 'test1234', username: 'Ro Talu', role: 'user' }, //
        ];

        // Buscar el usuario por email
        const foundUser = simulatedUsers.find(user => user.email === email);

        if (foundUser) {
            // Verificar la contraseña
            if (foundUser.password === password) {
                // Si las credenciales son correctas, pasamos TODOS los datos del 'foundUser'
                // directamente a la función login.
                login(foundUser); // ¡Aquí se pasan todos los datos del usuario simulado!
                // La redirección a /Nav se maneja automáticamente por el useEffect
            } else {
                setError('Contraseña incorrecta.');
            }
        } else {
            setError('Email no encontrado.');
        }
    };

    return (
        <div style={styles.container}>
            <div style={styles.card}>
                <h2 style={styles.cardHeader}>Iniciar Sesión</h2>
                <div style={styles.cardBody}>
                    <form onSubmit={handleSubmit}>
                        {error && <div style={styles.alertDanger}>{error}</div>}
                        <div style={styles.formGroup}>
                            <label htmlFor="emailInput" style={styles.formLabel}>Email</label>
                            <input
                                type="email"
                                className="form-control"
                                id="emailInput"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                                style={styles.input}
                            />
                        </div>
                        <div style={styles.formGroup}>
                            <label htmlFor="passwordInput" style={styles.formLabel}>Contraseña</label>
                            <input
                                type="password"
                                className="form-control"
                                id="passwordInput"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                                style={styles.input}
                            />
                        </div>
                        <button type="submit" style={styles.buttonPrimary}>
                            Ingresar
                        </button>
                    </form>
                </div>
            </div>
        </div>
    );
};

// --- Estilos ---
const styles = {
    container: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '80vh',
        backgroundColor: '#f8f9fa',
    },
    card: {
        backgroundColor: '#fff',
        borderRadius: '8px',
        boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
        overflow: 'hidden',
        width: '100%',
        maxWidth: '400px',
    },
    cardHeader: {
        backgroundColor: '#007bff',
        color: 'white',
        padding: '15px',
        textAlign: 'center',
        margin: 0,
    },
    cardBody: {
        padding: '30px',
    },
    formGroup: {
        marginBottom: '15px',
    },
    formLabel: {
        display: 'block',
        marginBottom: '5px',
        fontWeight: 'bold',
    },
    input: {
        width: '100%',
        padding: '10px',
        border: '1px solid #ced4da',
        borderRadius: '4px',
        boxSizing: 'border-box',
    },
    buttonPrimary: {
        backgroundColor: '#007bff',
        color: 'white',
        padding: '10px 15px',
        border: 'none',
        borderRadius: '4px',
        cursor: 'pointer',
        fontSize: '16px',
        width: '100%',
    },
    alertDanger: {
        backgroundColor: '#f8d7da',
        color: '#721c24',
        border: '1px solid #f5c6cb',
        borderRadius: '4px',
        padding: '10px',
        marginBottom: '15px',
        textAlign: 'center',
    },
};