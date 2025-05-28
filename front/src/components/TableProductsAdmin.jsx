import React, { useContext, useEffect, useState } from 'react';
import { CourseContext } from '../context/CourseContext';

export const TableProductsAdmin = () => {
    const { getCoursesWhitPays } = useContext(CourseContext);

    const [courses, setCourses] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const fetchCoursesData = async () => {
        try {
            setLoading(true);
            setError(null);

            const result = await getCoursesWhitPays();

            if (result && Array.isArray(result.courses)) {
                setCourses(result.courses);
            } else {
                console.warn("La API no devolvió el formato esperado para 'courses'. Recibido:", result);
                setCourses([]);
            }
        } catch (err) {
            console.error("Error al obtener los cursos con todos los detalles:", err);
            setError(err);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchCoursesData();
    }, []);

    if (loading) {
        return (
            <div className="container mt-5">
                <p className="text-center">Cargando cursos y sus detalles asociados...</p>
            </div>
        );
    }

    if (error) {
        return (
            <div className="container mt-5">
                <p className="text-center alert alert-danger">Error al cargar los cursos: {error.message}</p>
            </div>
        );
    }

    if (!Array.isArray(courses) || courses.length === 0) {
        return (
            <div className="container mt-5">
                <p className="text-center alert alert-info">No hay cursos registrados o no se pudieron cargar.</p>
            </div>
        );
    }

    return (
        <div className="container mt-5">
            <h2 className="mb-4 text-center">Administración de Cursos y Sus Actividades</h2>

            {courses.map((course) => {
                // **CORRECCIÓN CLAVE:** Obtener la primera inscripción (handle_course) si existe.
                // Esto asume que `course.handle_courses` es un array.
                const firstEnrollment = course.handle_courses && course.handle_courses.length > 0
                    ? course.handle_courses[0]
                    : null;

                // Definir las fechas para mostrar, tomando de la primera inscripción o 'Sin fecha'
                const courseStartDate = firstEnrollment && firstEnrollment.date_init
                    ? new Date(firstEnrollment.date_init).toLocaleDateString('es-ES')
                    : 'Sin fecha';

                const courseEndDate = firstEnrollment && firstEnrollment.date_end
                    ? new Date(firstEnrollment.date_end).toLocaleDateString('es-ES')
                    : 'Sin fecha';

                return (
                    <div key={course.id} className="card mb-4 shadow-sm border-primary">
                        <div className="card-header bg-primary text-white">
                            <h4 className="mb-0">Curso: {course.title || 'Título no disponible'} (ID: {course.id})</h4>
                        </div>
                        <div className="card-body">
                            <div className="row g-3">
                                <div className="col-md-3">
                                    {course.url_image ? (
                                        <img src={course.url_image} alt={course.title} className="img-fluid rounded border border-secondary" style={{ maxHeight: '150px', objectFit: 'cover', width: '100%' }} />
                                    ) : (
                                        <div className="text-center text-muted border p-3 rounded bg-light">No hay imagen</div>
                                    )}
                                </div>
                                <div className="col-md-9">
                                    <p><strong>Descripción:</strong> {course.description || 'Sin descripción'}</p>
                                    <p>
                                        <strong>Precio:</strong>{' '}
                                        {course.amount ?
                                            `$${course.amount.toLocaleString('es-AR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}` :
                                            'N/A'
                                        }
                                    </p>
                                    {/* **CORRECCIÓN:** USAMOS LAS FECHAS DE LA PRIMERA INSCRIPCIÓN */}
                                    <p>
                                        <strong>Inicio Inscripción:</strong>{' '}
                                        {courseStartDate}
                                    </p>
                                    <p>
                                        <strong>Fin Inscripción:</strong>{' '}
                                        {courseEndDate}
                                    </p>
                                    <p>
                                        <strong>Creado el:</strong>{' '}
                                        {new Date(course.created_at).toLocaleDateString('es-ES')}
                                    </p>

                                    {/* USAMOS EL ESTADO DERIVADO DE INSCRIPCIONES AQUI */}
                                    <p>
                                        <strong>Estado del Curso: </strong>
                                        <span className={`badge rounded-pill ${
                                            course.course_status_derived_from_enrollments === 'Próximo' ? 'bg-warning text-dark' :
                                            course.course_status_derived_from_enrollments === 'En Curso' ? 'bg-success' :
                                            course.course_status_derived_from_enrollments === 'Finalizado' ? 'bg-secondary' : 
                                            course.course_status_derived_from_enrollments === 'En Espera' ?  'bg-primary'  :
                                            'bg-dark' // Fallback para cualquier otro estado
                                        }`}>
                                            {course.course_status_derived_from_enrollments}
                                        </span>
                                    </p>

                                    <p>
                                        <strong>Pagos Recibidos:</strong>{' '}
                                        {course.payments_count !== undefined ? course.payments_count : 'N/A'}
                                    </p>

                                    <p>
                                        <strong>Veces Realizado (Iniciado):</strong>{' '}
                                        {course.handle_courses_count !== undefined ? course.handle_courses_count : 'N/A'}
                                    </p>
                                </div>
                            </div>

                            <h5 className="mt-4 mb-3 pb-2 border-bottom text-primary">Detalle de Pagos Recibidos:</h5>
                            {course.payments && Array.isArray(course.payments) && course.payments.length > 0 ? (
                                <div className="table-responsive">
                                    <table className="table table-sm table-bordered table-hover align-middle">
                                        <thead className="table-light">
                                            <tr>
                                                <th scope="col">ID Pago</th>
                                                <th scope="col">Monto Pagado</th>
                                                <th scope="col">Estado Pago</th>
                                                <th scope="col">Email del Pagador</th>
                                                <th scope="col">Fecha de Pago</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {course.payments.map((payment) => (
                                                <tr key={payment.id}>
                                                    <td>{payment.id}</td>
                                                    <td>
                                                        {`$${(payment.amount || 0).toLocaleString('es-AR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })} ${payment.currency || 'ARS'}`}
                                                    </td>
                                                    <td>{payment.status}</td>
                                                    <td>{payment.email || 'N/A'}</td>
                                                    <td>{new Date(payment.created_at).toLocaleDateString('es-ES')}</td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            ) : (
                                <p className="text-muted">No hay pagos registrados para este curso.</p>
                            )}

                            <h5 className="mt-4 mb-3 pb-2 border-bottom text-primary">Detalle de Inscripciones Iniciadas:</h5>
                            {/* ESTA SECCIÓN MUESTRA SOLO LAS INSCRIPCIONES CUYA date_init ES < A HOY (filtrado en el controlador) */}
                            {course.handle_courses && Array.isArray(course.handle_courses) && course.handle_courses.length > 0 ? (
                                <div className="table-responsive">
                                    <table className="table table-sm table-bordered table-hover align-middle">
                                        <thead className="table-light">
                                            <tr>
                                                <th scope="col">ID Inscripción</th>
                                                <th scope="col">Usuario (ID)</th>                                                 
                                                <th scope="col">Estado DB</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {course.handle_courses.map((handleCourse) => (
                                                <tr key={handleCourse.id}>
                                                    <td>{handleCourse.id}</td>
                                                    <td>{handleCourse.id_user || 'N/A'}</td>
                                                    {/* **CORRECCIÓN:** Mostrar fechas de cada handle_course */}
                                                     
                                                    <td>
                                                        <span className={`badge rounded-pill ${
                                                            handleCourse.status === 'pending' ? 'bg-secondary' :
                                                            handleCourse.status === 'active' ? 'bg-info text-dark' :
                                                            handleCourse.status === 'completed' ? 'bg-success' :
                                                            handleCourse.status === 'cancelled' ? 'bg-danger' :
                                                            'bg-light text-dark'
                                                        }`}>
                                                            {handleCourse.status}
                                                        </span>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            ) : (
                                <p className="text-muted">No hay registros de inscripciones iniciadas para este curso.</p>
                            )}
                        </div>
                    </div>
                );
            })}
        </div>
    );
};