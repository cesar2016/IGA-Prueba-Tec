import React, { useContext, useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Loader, PaymentForm, TableProductsAdmin, TableProductsName } from '../components';
import { CourseContext } from '../context/CourseContext';
import { primerMayuscula } from '../helper/helper';

export const AdminCourses = () => {

		const { getCoursesWhitPays } = useContext(CourseContext);		 
		
	 
	return (
		<>
			<TableProductsAdmin		 
				getCoursesWhitPays
			/>
			 
		</>

	)
};
