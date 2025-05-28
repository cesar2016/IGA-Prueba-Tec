import React, { useEffect, useState, useCallback } from 'react'; // Added useCallback
import { useForm } from '../hook/useForm'; // Assuming this hook works fine
import { CourseContext } from './CourseContext';

export const CourseProvider = ({ children }) => {
    // Estado para la paginación/carga de más
    const [offset, setOffset] = useState(0);
    const [limit, setLimit] = useState(25); // Un límite por defecto, ajusta según necesites

    // Utilizar CustomHook - useForm
    const { valueSearch, onInputChange, onResetForm } = useForm({
        valueSearch: '',
    });

    // Estados para la aplicación
    const [loading, setLoading] = useState(true);
    const [active, setActive] = useState(false); // Para el filtro activo, si lo usas
    
    
    const [allCourses, setAllCourses] = useState({ courses: [] }); 
     
    const [filteredCourses, setFilteredCourses] = useState({ courses: [] }); 

     
    const getCoursesAll = useCallback(async () => {
        setLoading(true); 
        try {
            const baseURL = 'http://localhost:9200/api/getAllCourses'; 
             
            const res = await fetch(`${baseURL}?limit=${limit}&offset=${offset}`);
            
            if (!res.ok) { // Manejo de errores de red/respuesta HTTP
                throw new Error(`HTTP error! status: ${res.status}`);
            }

            const data = await res.json(); 
             

            if (data && Array.isArray(data.courses)) {
                
                setAllCourses(data); 
                setFilteredCourses(data);  
            } else {
                console.error("API response for getAllCourses is not in the expected format: { courses: Array }", data);
                setAllCourses({ courses: [] }); // Fallback a un array vacío
                setFilteredCourses({ courses: [] });
            }
        } catch (error) {
            console.error('Error al obtener todos los cursos:', error);
            setAllCourses({ courses: [] });  
            setFilteredCourses({ courses: [] });
        } finally {
            setLoading(false);  
        }
    }, [offset, limit]);  

     
    const getCourseByID = async id => {
        const baseURL = 'http://localhost:9200/api/getCourseById';
        try {
            const res = await fetch(`${baseURL}/${id}`);
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            const data = await res.json();      
            return data;
        } catch (error) {
            console.error('Error al obtener curso por ID:', error);
            return null;  
        }
    };  

     
    const getPayUserById = async id => {
        const baseURL = 'http://localhost:9200/api/getPayById'; 
        try {
            const res = await fetch(`${baseURL}/${id}`);
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            const data = await res.json(); 
            return data;
        } catch (error) {
            console.error('Error al obtener pagos de usuario por ID:', error);
            return null;
        }
    };

     
    const getCoursesWhitPays = async () => { // 
        const baseURL = 'http://localhost:9200/api/getAllCoursesAndPay'; 
        setLoading(true); // Should set loading true here if this also fetches primary data
        try {
            const res = await fetch(`${baseURL}`);
            if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
            const data = await res.json(); 
            
            return data;
        } catch (error) {
            console.error('Error al obtener cursos con pagos:', error);
            return null;
        } finally {
            setLoading(false); 
        }
    };  
     
    
    useEffect(() => {
        getCoursesAll();
    }, [getCoursesAll]); 
     
    const onClickLoadMore = () => {
        setOffset(prevOffset => prevOffset + limit);  
    };

    // Función de filtrado (ejemplo, si la necesitas en el contexto)
    const handleFilterCourses = (searchTerm) => {
        if (!searchTerm) {
            setFilteredCourses(allCourses);  
            return;
        }
        const lowerCaseSearchTerm = searchTerm.toLowerCase();
         
        const results = allCourses.courses.filter(course => 
            course.title.toLowerCase().includes(lowerCaseSearchTerm)  
        );
         
        setFilteredCourses({ courses: results }); 
    };

    return (
        <CourseContext.Provider
            value={{
                valueSearch,
                onInputChange,
                onResetForm,                 
                onClickLoadMore,
                loading,
                active,
                setActive,
                allCourses,  
                filteredCourses,  
                getCourseByID,
                getPayUserById,
                getCoursesWhitPays,
                handleFilterCourses 
            }}
        >
            {children}
        </CourseContext.Provider>
    );
};