import React, { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Loader, PaymentForm } from '../components';
import { CourseContext } from '../context/CourseContext';
import { primerMayuscula } from '../helper/helper';

export const IgaCourses = () => {
	const { getCourseByID } = useContext(CourseContext);	

	const [loading, setLoading] = useState(true);
	const [course, setCourse] = useState({});

	const { id } = useParams();

	const fetchCourse = async id => {
		const data = await getCourseByID(id);
		setCourse(data);
		setLoading(false);
	};
 
	useEffect(() => {
		fetchCourse(id);
	}, []);

	return (
		<main className='container main-pokemon' style={{ 

			marginTop: '0px'
			
			  }}>
			{loading ? (
				<Loader />
			) : (
				<>
				<div className='header-main-pokemon'>
						
						<div className='container-img-pokemon'>
						
							<img
								src={course.course.url_image}
								alt={`Course ${course.course.id}`}
							/>
						</div>
						 
						<div className='container-info-pokemon' style={{ 

							marginTop: '0px', marginLeft: '5px'
							
							  }}>
							<h2>{course.course.title}</h2>
							<div className='card-types info-pokemon-type'>
								 
								<span key={course.course.id} className={`fire`}>
									<h3>$ {course.course.amount}</h3>
								</span>
								 
							</div>
							<div className='info-pokemon m-5'>
								<div className='group-info'>
									<p>Info del curso</p>
									<span>{course.course.description}</span>							 
									 
								</div>
							</div>
						</div>
					</div>

					<div className='container-stats'>
						<PaymentForm 
							amount={course.course.amount}
							id_course={course.course.id}
						/>
					</div>  
				</>
			)}
		</main>
	);
};
