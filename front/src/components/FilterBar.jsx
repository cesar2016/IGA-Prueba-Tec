import React, { useContext } from 'react';
import { CourseContext } from '../context/CourseContext';

export const FilterBar = () => {
	const { active, handleCheckbox } = useContext(CourseContext);

	return (
		<div className={`container-filters`}>
			 
		</div>
	);
};
