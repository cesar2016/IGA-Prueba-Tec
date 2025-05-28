import React, { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Loader, PaymentForm, TableProductsName } from '../components';
import { CourseContext } from '../context/CourseContext';
import { primerMayuscula } from '../helper/helper';

export const MyCourses = () => {

		const { getPayUserById, getCoursesAll } = useContext(CourseContext);		 
		
	 
	return (
		<>
			<TableProductsName 				 
				getPayUserById
			/>
			 
		</>

	)
};
