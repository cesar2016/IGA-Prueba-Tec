import React, { useContext } from 'react';
import { CourseContext } from '../context/CourseContext';
import { CardCourse } from './CardCourse';
import { Loader } from './Loader';

export const CoursesList = () => {
	const { loading, allCourses } =
		useContext(CourseContext);	
 
		 

	return (
		<>  
			{loading ? (
				<Loader />
			) : (
				<div className='card-list-pokemon container'>
                        
					{allCourses.courses.map(course => ( 
						<CardCourse course={course} key={course.id} />
					))}
                        
                    
				</div>
			)}
		</>
	);
};

