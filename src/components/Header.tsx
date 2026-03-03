import { BookOpen } from 'lucide-react';

export default function Header() {
  return (
    <header className="bg-gradient-to-r from-yellow-400 to-yellow-500 shadow-lg">
      <div className="w-full px-4 sm:px-6 lg:px-8 py-4 sm:py-6">
        <div className="flex items-center gap-3 sm:gap-4">
          <BookOpen className="w-8 sm:w-10 lg:w-12 h-8 sm:h-10 lg:h-12 text-green-700 flex-shrink-0" strokeWidth={2.5} />
          <h1 className="text-lg sm:text-2xl lg:text-3xl font-bold text-green-700 truncate">
            BIBLIOTECA DON BOSCO
          </h1>
        </div>
      </div>
    </header>
  );
}
