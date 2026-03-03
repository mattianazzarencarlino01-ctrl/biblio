import Header from './components/Header';

function App() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex flex-col">
      <Header />
      <main className="flex-1 w-full px-4 sm:px-6 lg:px-8 py-4 sm:py-8">
        <div className="bg-white rounded-2xl sm:rounded-3xl shadow-lg sm:shadow-xl p-8 sm:p-12 w-full text-center">
          <h2 className="text-2xl sm:text-4xl font-bold text-gray-800 mb-4">Benvenuto</h2>
          <p className="text-gray-600 text-lg">L'app è in preparazione</p>
        </div>
      </main>
    </div>
  );
}

export default App;
