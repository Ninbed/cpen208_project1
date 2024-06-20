// pages/dashboard.tsx
import { FaUserCircle, FaCalendarAlt, FaUsers,FaSearch, FaBookReader, FaChartBar, FaBookOpen, FaCheck } from 'react-icons/fa';
import Image from 'next/image';
import { FaCediSign, FaCentSign } from 'react-icons/fa6';
const DashboardPage = () => {
  return (
    <div className="min-h-screen bg-green-100 flex flex-col items-center">
      <header className="w-full bg-white shadow p-4 flex justify-between items-center">
        <h1 className="text-2xl font-semibold text-green-400">Welcome to Student Portal</h1>
        <div className="flex items-center space-x-4">
          <div className="relative">
            <input
              type="text"
              placeholder="Search"
              className="pl-10 pr-4 py-2 border border-green-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-500"
            />
            <FaSearch className="absolute left-3 top-3 text-blue-300" />
          </div>
          <Image
            src="/images/road.jpg"
            alt="Profile"
            width={180}
            height={180}
            className="w-10 h-10 rounded-full border-2 border-green-300"
          />
        </div>
      </header>

      <main className="flex-1 flex flex-col items-center justify-center p-6">
        <div className="grid grid-cols-4 gap-6">
          <Tile icon={<FaUserCircle />} label="PROFILE" />
          <Tile icon={<FaCalendarAlt />} label="EVENTS" />
          <Tile icon={<FaUsers />} label="STAFFS" />
          <Tile icon={<FaCheck />} label="Attendance" />
          <Tile icon={<FaBookReader />} label="COURSES" />
          <Tile icon={<FaChartBar />} label="GradeSheet" />
          <Tile icon={<FaBookOpen />} label="Assignments" />
          <Tile icon={<FaCediSign />} label="Fees Details" />
        </div>
      </main>
    </div>
  );
};

interface TileProps {
  icon: React.ReactNode;
  label: string;
}

const Tile: React.FC<TileProps> = ({ icon, label }) => {
  return (
    <div className="p-6 bg-white rounded-lg shadow-md flex flex-col items-center justify-center">
      <div className="text-4xl text-green-500 mb-4">{icon}</div>
      <div className="font-semibold text-gray-700">{label}</div>
    </div>
  );
};

export default DashboardPage;