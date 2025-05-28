import React, { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

import { CourseContext } from '../context/CourseContext';

export const TableProductsName = () => {
    const { getPayUserById } = useContext(CourseContext);
    const { id } = useParams();

    const [pay, setPay] = useState([]);
    const [loadingPayments, setLoadingPayments] = useState(true);
    const [errorPayments, setErrorPayments] = useState(null);

    const fetchPay = async (userId) => {
        setLoadingPayments(true);
        setErrorPayments(null);
        try {
            const data = await getPayUserById(userId);
            setPay(data);
        } catch (err) {
            console.error("Error al obtener los pagos del usuario:", err);
            setErrorPayments(err);
        } finally {
            setLoadingPayments(false);
        }
    };

    useEffect(() => {
        if (id) {
            fetchPay(id);
        }
    }, [id, getPayUserById]);

    if (loadingPayments) {
        return (
            <div className="container mt-5 d-flex justify-content-center align-items-center" style={{ minHeight: '200px' }}>
                <div className="spinner-border text-primary" role="status">
                    <span className="visually-hidden">Cargando...</span>
                </div>
                <p className="ms-3 text-muted">Cargando pagos y cursos asociados...</p>
            </div>
        );
    }

    if (errorPayments) {
        return (
            <div className="container mt-5">
                <div className="alert alert-danger text-center shadow-sm" role="alert">
                    <h4 className="alert-heading">¡Error al cargar los pagos!</h4>
                    <p>Lo sentimos, no pudimos obtener la información de sus pagos en este momento.</p>
                    <hr />
                    <p className="mb-0 small">Detalle del error: {errorPayments.message || 'Error desconocido.'}</p>
                </div>
            </div>
        );
    }

    if (!Array.isArray(pay) || pay.length === 0) {
        return (
            <div className="container mt-5">
                <div className="alert alert-info text-center shadow-sm" role="alert">
                    <h4 className="alert-heading">No hay pagos registrados</h4>
                    <p className="mb-0">Aún no se han encontrado pagos o cursos asociados para este usuario.</p>
                </div>
            </div>
        );
    }

    return (
        <div className="container mt-5 mb-5">
            <h2 className="mb-4 text-center text-primary">Mis Pagos y Cursos Adquiridos</h2>

            <div className="card shadow-lg p-3 mb-5 bg-body rounded">
                <div className="card-body">
                    <div className="table-responsive">
                        <table className="table table-hover align-middle caption-top">
                            <caption>Lista de sus compras recientes</caption>
                            <thead className="table-dark">
                                <tr>
                                    <th scope="col" style={{ width: '8%' }}>ID Pago</th>
                                    <th scope="col" style={{ width: '35%' }}>Curso Adquirido</th>
                                    <th scope="col" style={{ width: '12%' }}>Monto Pagado</th>
                                    <th scope="col" style={{ width: '10%' }}>Estado Pago</th> {/* Renombrado para evitar confusión */}
                                    <th scope="col" style={{ width: '10%' }}>Estado Curso</th> {/* Nueva columna */}
                                    <th scope="col" style={{ width: '15%' }}>Fecha Pago</th>
                                    <th scope="col" style={{ width: '10%' }}>Inicio Curso</th>
                                    <th scope="col" style={{ width: '10%' }}>Fin Curso</th>
                                </tr>
                            </thead>
                            <tbody>
                                {pay.map((payment) => (
                                    <tr key={payment.id}>
                                        <td>
                                            <span className="text-muted small">#{payment.id}</span>
                                        </td>
                                        <td>
                                            {payment.course ? (
                                                <div className="d-flex align-items-center">
                                                    {payment.course.url_image && (
                                                        <img
                                                            src={payment.course.url_image}
                                                            alt={payment.course.title || 'Imagen del Curso'}
                                                            className="rounded-3 me-3 border border-light"
                                                            style={{ width: '70px', height: '70px', objectFit: 'cover' }}
                                                        />
                                                    )}
                                                    <div>
                                                        <h6 className="mb-0 text-dark">
                                                            {payment.course.title || 'Título no disponible'}
                                                        </h6>
                                                        {payment.course.description && (
                                                            <small className="text-muted d-block mt-1">
                                                                {payment.course.description.length > 80
                                                                    ? payment.course.description.substring(0, 80) + '...'
                                                                    : payment.course.description}
                                                            </small>
                                                        )}
                                                    </div>
                                                </div>
                                            ) : (
                                                <span className="text-muted">Curso no disponible</span>
                                            )}
                                        </td>
                                        <td>
                                            <span className="fw-bold text-success">
                                                {`$${(payment.amount || 0).toLocaleString('es-AR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`}
                                            </span>
                                        </td>
                                        <td>
                                            <span className={`badge rounded-pill ${
                                                payment.status === 'completed' ? 'bg-success' :
                                                payment.status === 'pending' ? 'bg-warning text-dark' :
                                                payment.status === 'failed' ? 'bg-danger' :
                                                'bg-secondary'
                                            }`}>
                                                {payment.status || 'N/A'}
                                            </span>
                                        </td>
                                        {/* **NUEVA COLUMNA: ESTADO DEL CURSO BASADO EN handle_course_status_for_this_payment** */}
                                        <td>
                                            {payment.course && payment.course.handle_course_status_for_this_payment ? (
                                                <span className={`badge rounded-pill ${
                                                    payment.course.handle_course_status_for_this_payment === 'active' ? 'bg-info text-dark' :
                                                    payment.course.handle_course_status_for_this_payment === 'pending' ? 'bg-secondary' :
                                                    payment.course.handle_course_status_for_this_payment === 'completed' ? 'bg-success' :
                                                    payment.course.handle_course_status_for_this_payment === 'cancelled' ? 'bg-danger' :
                                                    'bg-dark'
                                                }`}>
                                                    {payment.course.handle_course_status_for_this_payment}
                                                </span>
                                            ) : (
                                                <span className="text-muted">N/A</span>
                                            )}
                                        </td>
                                        <td>
                                            {payment.created_at ? new Date(payment.created_at).toLocaleDateString('es-ES', {
                                                year: 'numeric', month: 'short', day: 'numeric'
                                            }) : 'N/A'}
                                        </td>
                                        <td>
                                            {payment.course && payment.course.handle_course_start_date_for_this_payment
                                                ? new Date(payment.course.handle_course_start_date_for_this_payment).toLocaleDateString('es-ES')
                                                : 'N/A'}
                                        </td>
                                        <td>
                                            {payment.course && payment.course.handle_course_end_date_for_this_payment
                                                ? new Date(payment.course.handle_course_end_date_for_this_payment).toLocaleDateString('es-ES')
                                                : 'N/A'}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );
};