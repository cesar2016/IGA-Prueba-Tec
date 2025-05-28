import { useContext } from 'react';
import React, { useEffect, useState } from 'react';
import { Link, Outlet, useNavigate } from 'react-router-dom';
import { CourseContext } from '../context/CourseContext';
import { useAuth } from '../context/AuthContext';
import logo from '../assets/Pokédex_logo.png'

// Componente del formulario de pago
export const PaymentForm = ( { id_course, amount } ) => {

    const navigate = useNavigate();
        // Obtén la función logout Y el objeto 'user' del contexto de autenticación
        const { logout, user } = useAuth(); 

        console.log(id_course)

    const [formData, setFormData] = useState({
        fullName: '',
        email: '',
        phone: '',
        cardNumber: '',
        expiryDate: '', // Formato YYYY-MM
        cardHolderName: '',
        dni: '',
        cvv: '',
		course_id: id_course,
		amount: amount,
		user_id: user.id

    });

    const [errors, setErrors] = useState({});
    const [loading, setLoading] = useState(false); // Nuevo estado para indicar si se está enviando
    const [submitMessage, setSubmitMessage] = useState(null); // Nuevo estado para mensajes de éxito/error

    const handleChange = (e) => {
        const { name, value } = e.target;
        let newErrors = { ...errors };

        // Limpiar mensaje de submit al cambiar algo
        setSubmitMessage(null);

        switch (name) {
            case 'cardNumber':
                if (!/^\d*$/.test(value)) {
                    newErrors.cardNumber = 'Solo números permitidos.';
                } else if (value.length > 16) {
                    newErrors.cardNumber = 'Máximo 16 dígitos.';
                } else {
                    delete newErrors.cardNumber;
                }
                break;
            case 'dni':
                if (!/^\d*$/.test(value)) {
                    newErrors.dni = 'Solo números permitidos.';
                } else if (value.length > 8) {
                    newErrors.dni = 'Debe tener 8 dígitos.';
                } else {
                    delete newErrors.dni;
                }
                break;
            case 'cvv':
                if (!/^\d*$/.test(value)) {
                    newErrors.cvv = 'Solo números permitidos.';
                } else if (value.length > 4) {
                    newErrors.cvv = 'Máximo 4 dígitos.';
                } else {
                    delete newErrors.cvv;
                }
                break;
            case 'email':
                if (value && !/\S+@\S+\.\S+/.test(value)) {
                    newErrors.email = 'Formato de email inválido.';
                } else {
                    delete newErrors.email;
                }
                break;
            case 'phone':
                if (value && !/^\d*$/.test(value)) {
                    newErrors.phone = 'Solo números permitidos.';
                } else {
                    delete newErrors.phone;
                }
                break;
            default:
                break;
        }

        setErrors(newErrors);
        setFormData({ ...formData, [name]: value });
    };

    const validateForm = () => {
        let formErrors = {};
        let isValid = true;

        // Validaciones de campos de contacto
        if (!formData.fullName.trim()) {
            formErrors.fullName = 'El nombre y apellido son obligatorios.';
            isValid = false;
        }
        if (!formData.email.trim()) {
            formErrors.email = 'El email es obligatorio.';
            isValid = false;
        } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
            formErrors.email = 'Formato de email inválido.';
            isValid = false;
        }
        if (!formData.phone.trim()) {
            formErrors.phone = 'El celular es obligatorio.';
            isValid = false;
        } else if (!/^\d+$/.test(formData.phone.trim())) {
            formErrors.phone = 'El celular solo puede contener números.';
            isValid = false;
        }

        // Validaciones de campos de tarjeta
        if (!formData.cardNumber.trim()) {
            formErrors.cardNumber = 'El número de tarjeta es obligatorio.';
            isValid = false;
        } else if (!/^\d{13,16}$/.test(formData.cardNumber.trim())) {
            formErrors.cardNumber = 'Número de tarjeta inválido (13-16 dígitos).';
            isValid = false;
        }
        if (!formData.expiryDate.trim()) {
            formErrors.expiryDate = 'La fecha de vencimiento es obligatoria.';
            isValid = false;
        } else {
            const [inputYear, inputMonth] = formData.expiryDate.split('-').map(Number); // Convertir a número
            const currentYear = new Date().getFullYear();
            const currentMonth = new Date().getMonth() + 1;

            if (isNaN(inputMonth) || isNaN(inputYear) || inputMonth < 1 || inputMonth > 12) {
                formErrors.expiryDate = 'Formato de fecha inválido (YYYY-MM).';
                isValid = false;
            } else if (inputYear < currentYear || (inputYear === currentYear && inputMonth < currentMonth)) {
                formErrors.expiryDate = 'La tarjeta ha expirado.';
                isValid = false;
            }
        }
        if (!formData.cardHolderName.trim()) {
            formErrors.cardHolderName = 'El nombre del titular es obligatorio.';
            isValid = false;
        }
        if (!formData.dni.trim()) {
            formErrors.dni = 'El DNI es obligatorio.';
            isValid = false;
        } else if (!/^\d{8}$/.test(formData.dni.trim())) {
            formErrors.dni = 'El DNI debe tener exactamente 8 dígitos numéricos.';
            isValid = false;
        }
        if (!formData.cvv.trim()) {
            formErrors.cvv = 'El CVV es obligatorio.';
            isValid = false;
        } else if (!/^\d{3,4}$/.test(formData.cvv.trim())) {
            formErrors.cvv = 'El CVV debe tener 3 o 4 dígitos numéricos.';
            isValid = false;
        }

        setErrors(formErrors);
        return isValid;
    };

    // Función para manejar el envío del formulario
    const handleSubmit = async (e) => { // Agregamos 'async' aquí
        e.preventDefault();

        // Limpiar mensajes anteriores
        setSubmitMessage(null);
        setErrors({});

        if (!validateForm()) {
            setSubmitMessage({ type: 'error', text: 'Por favor, corrige los errores en el formulario.' });
            return; // Detiene el envío si hay errores de validación
        }

        setLoading(true); // Indica que la operación de envío está en curso

        try {
            const response = await fetch('http://localhost:9200/api/coursePay', {
                method: 'POST', // Usar método POST para enviar datos
                headers: {
                    'Content-Type': 'application/json', // Indicar que estamos enviando JSON
                    'Accept': 'application/json', // Indicar que esperamos una respuesta JSON
                    // Opcional: Si tu API requiere un token CSRF (para Laravel), lo añadirías aquí
                    //'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
                body: JSON.stringify(formData), // Convertir los datos del formulario a JSON
            });

            const responseData = await response.json(); // Intentar parsear la respuesta JSON

            if (response.ok) { // Si la respuesta HTTP es 2xx (éxito)
                setSubmitMessage({ type: 'success', text: responseData.message || 'Pago realizado con éxito.' });
                // Aquí se podría resetear el formulario si el pago fue exitoso
                setFormData({
                    fullName: '',
                    email: '',
                    phone: '',
                    cardNumber: '',
                    expiryDate: '',
                    cardHolderName: '',
                    dni: '',
                    cvv: '' 
                });
            } else { // Si la respuesta HTTP es un error (4xx, 5xx)
                console.error('Error en la respuesta del servidor:', responseData);
                // Si el backend devuelve errores de validación, puedes mostrarlos
                if (response.status === 422 && responseData.errors) { // 422 Unprocessable Entity es común para errores de validación
                    setErrors(responseData.errors); // Asume que el backend devuelve un objeto 'errors'
                    setSubmitMessage({ type: 'error', text: 'Errores de validación. Por favor, revisa tus datos.' });
                } else {
                    setSubmitMessage({ type: 'error', text: responseData.message || 'Hubo un problema al procesar el pago.' });
                }
            }
        } catch (error) {
            console.error('Error de red o al enviar el formulario:', error);
            setSubmitMessage({ type: 'error', text: 'No se pudo conectar con el servidor. Inténtalo de nuevo más tarde.' });
        } finally {
            setLoading(false); // La operación de envío ha terminado (éxito o error)
        }
    };

    return (
        <div className="container mt-5">
            <div className="row justify-content-center">
                <div className="col-md-8 col-lg-6">
                    <div className="card shadow-lg p-4">
                        <h2 className="card-title text-center mb-4">Formulario de Pago</h2>

                        {/* Mensajes de éxito/error del submit */}
                        {submitMessage && (
                            <div className={`alert alert-${submitMessage.type === 'success' ? 'success' : 'danger'}`} role="alert">
                                {submitMessage.text}
                            </div>
                        )}

                        <form onSubmit={handleSubmit}>
                            {/* Sección de Datos Personales */}
                            <h5 className="mb-3">Datos Personales</h5>

								<input
									type='hidden' 									
									name="course_id" 
									id="course_id" 
									value={formData.course_id}
									onChange={handleChange}
								/>
								<input
									type='hidden' 									
									name="amount"
									id="amount"
									value={formData.amount}
									onChange={handleChange}
								/>
                                <input
									type='hidden' 									
									name="user_id"
									id="user_id"
									value={formData.user_id}
									onChange={handleChange}
								/>

                            <div className="mb-3">
                                <label htmlFor="fullName" className="form-label">Nombre y Apellido</label>
                                <input
                                    type="text"
                                    className={`form-control ${errors.fullName ? 'is-invalid' : ''}`}
                                    id="fullName"
                                    name="fullName"
                                    value={formData.fullName}
                                    onChange={handleChange}
                                    placeholder="Ej: Juan Pérez"
                                />
                                {errors.fullName && <div className="invalid-feedback">{errors.fullName}</div>}
                            </div>								
                            <div className="mb-3">
                                <label htmlFor="email" className="form-label">Email</label>
                                <input
                                    type="email"
                                    className={`form-control ${errors.email ? 'is-invalid' : ''}`}
                                    id="email"
                                    name="email"
                                    value={formData.email}
                                    onChange={handleChange}
                                    placeholder="ejemplo@dominio.com"
                                />
                                {errors.email && <div className="invalid-feedback">{errors.email}</div>}
                            </div>
                            <div className="mb-4">
                                <label htmlFor="phone" className="form-label">Celular</label>
                                <input
                                    type="text"
                                    className={`form-control ${errors.phone ? 'is-invalid' : ''}`}
                                    id="phone"
                                    name="phone"
                                    value={formData.phone}
                                    onChange={handleChange}
                                    placeholder="Ej: 1123456789"
                                />
                                {errors.phone && <div className="invalid-feedback">{errors.phone}</div>}
                            </div>

                            {/* Sección de Datos de Tarjeta */}
                            <h5 className="mb-3">Datos de Tarjeta</h5>
                            <div className="mb-3">
                                <label htmlFor="cardNumber" className="form-label">Número de Tarjeta</label>
                                <input
                                    type="text"
                                    className={`form-control ${errors.cardNumber ? 'is-invalid' : ''}`}
                                    id="cardNumber"
                                    name="cardNumber"
                                    value={formData.cardNumber}
                                    onChange={handleChange}
                                    maxLength="16"
                                    placeholder="Ej: 1234567890123456"
                                />
                                {errors.cardNumber && <div className="invalid-feedback">{errors.cardNumber}</div>}
                            </div>
                            <div className="row mb-3">
                                <div className="col-md-8">
                                    <label htmlFor="expiryDate" className="form-label">Fecha de Vencimiento (MM/AA)</label>
                                    <input
                                        type="month"
                                        className={`form-control ${errors.expiryDate ? 'is-invalid' : ''}`}
                                        id="expiryDate"
                                        name="expiryDate"
                                        value={formData.expiryDate}
                                        onChange={handleChange}
                                    />
                                    {errors.expiryDate && <div className="invalid-feedback">{errors.expiryDate}</div>}
                                </div>
                                <div className="col-md-4">
                                    <label htmlFor="cvv" className="form-label">CVV</label>
                                    <input
                                        type="text"
                                        className={`form-control ${errors.cvv ? 'is-invalid' : ''}`}
                                        id="cvv"
                                        name="cvv"
                                        value={formData.cvv}
                                        onChange={handleChange}
                                        maxLength="4"
                                        placeholder="Ej: 123"
                                    />
                                    {errors.cvv && <div className="invalid-feedback">{errors.cvv}</div>}
                                </div>
                            </div>
                            <div className="mb-3">
                                <label htmlFor="cardHolderName" className="form-label">Nombre y Apellido del Titular</label>
                                <input
                                    type="text"
                                    className={`form-control ${errors.cardHolderName ? 'is-invalid' : ''}`}
                                    id="cardHolderName"
                                    name="cardHolderName"
                                    value={formData.cardHolderName}
                                    onChange={handleChange}
                                    placeholder="Tal como aparece en la tarjeta"
                                />
                                {errors.cardHolderName && <div className="invalid-feedback">{errors.cardHolderName}</div>}
                            </div>
                            <div className="mb-4">
                                <label htmlFor="dni" className="form-label">DNI</label>
                                <input
                                    type="text"
                                    className={`form-control ${errors.dni ? 'is-invalid' : ''}`}
                                    id="dni"
                                    name="dni"
                                    value={formData.dni}
                                    onChange={handleChange}
                                    maxLength="8"
                                    placeholder="Ej: 12345678"
                                />
                                {errors.dni && <div className="invalid-feedback">{errors.dni}</div>}
                            </div>

                            <button
                                type="submit"
                                className="btn btn-primary w-100"
                                disabled={loading} // Deshabilita el botón mientras se envía
                            >
                                {loading ? 'Enviando Pago...' : 'Realizar Pago'}
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    );
};

 
