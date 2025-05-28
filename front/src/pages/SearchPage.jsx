import React, { useContext } from 'react';
import { useLocation } from 'react-router-dom';
import { CardCourse } from '../components';
import { CourseContext } from '../context/CourseContext';

export const SearchPage = () => {
	const location = useLocation();

	const { globalPokemons } = useContext(CourseContext);

	const filteredPokemons = globalPokemons.filter(pokemon =>
		pokemon.name.includes(location.state.toLowerCase())
	);

	return (
		<div className='container'>
			<p className='p-search'>
				Se encontraron <span>{filteredPokemons.length}</span>{' '}
				resultados:
			</p>
			<div className='card-list-pokemon container'>
				{filteredPokemons.map(pokemon => (
					<CardCourse pokemon={pokemon} key={pokemon.id} />
				))}
			</div>
		</div>
	);
};
