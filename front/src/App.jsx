import { AppRouter } from './AppRouter';
import { CourseProvider } from './context/CourseProvider';


// My App Cear Sanchez
function App() {
	return (
		<CourseProvider>
			<AppRouter />
		</CourseProvider>
	);
}

export default App;
