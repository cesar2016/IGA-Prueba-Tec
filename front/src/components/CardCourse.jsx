import React from 'react';
import { Link } from 'react-router-dom';

export const CardCourse = ({ course }) => {	 
	return (
		<Link to={`course/${course.id}`} className='card-pokemon'>
			<div className='card-img'>
				<img
					src={course.url_image}
					alt={`Curso ${course.title}`}
				/>
			</div>
			<div className='card-info'>
				<span className='pokemon-id'>N° {course.id}</span>
				<h3>{course.title}</h3>
				<div className='card-types'>

					<span className={"poison"}>
						$ {course.amount}
					</span>
					<span className={"fire"}>
						Comprar ahora
					</span>					 
					 
				</div>
			</div>
		</Link>
	);
};
