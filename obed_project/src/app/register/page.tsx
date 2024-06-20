import React from 'react';
import { FaUser, FaEnvelope, FaLock, FaIdCard } from 'react-icons/fa';

const RegisterPage: React.FC = () => {
  return (
    <div className="min-h-screen flex items-center justify-center bg-cover bg-center bg-bg-img">
      <div className="bg-white bg-opacity-90 rounded-lg shadow-lg p-8 max-w-md mx-auto">
        <div className="flex justify-center mb-4">
          <div className="bg-gray-200 p-2 rounded-full">
            <FaUser size={24} />
          </div>
        </div>
        <h2 className="text-2xl font-semibold text-center text-green-500 mb-4">Register Account</h2>
        <form>
          <div className="mb-4">
            <label className="block mb-1 text-sm font-medium text-gray-700">
              <FaUser className="inline mr-2" />Your Name
            </label>
            <input
              type="text"
              placeholder="Your Name"
              className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500"
            />
          </div>
          <div className="mb-4">
            <label className="block mb-1 text-sm font-medium text-gray-700">
              <FaIdCard className="inline mr-2" />Sudent ID
            </label>
            <input
              type="text"
              placeholder="Username"
              className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500"
            />
          </div>
          <div className="mb-4">
            <label className="block mb-1 text-sm font-medium text-gray-700">
              <FaEnvelope className="inline mr-2" />Your Email
            </label>
            <input
              type="email"
              placeholder="Your Email"
              className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500"
            />
          </div>
          <div className="mb-4">
            <label className="block mb-1 text-sm font-medium text-gray-700">
              <FaLock className="inline mr-2" />Password
            </label>
            <input
              type="password"
              placeholder="Password"
              className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500"
            />
          </div>
          <div className="mb-4">
            <label className="block mb-1 text-sm font-medium text-gray-700">
              <FaLock className="inline mr-2" />Confirm Password
            </label>
            <input
              type="password"
              placeholder="Confirm Password"
              className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500"
            />
          </div>
          <button
            type="submit"
            className="w-full bg-green-500 text-white py-2 rounded-md hover:bg-green-600"
          >
            Register
          </button>
          <p className="mt-4 text-xs text-gray-600 text-center">
            Information shared is very secured. By signing up, you agree to our <a href="#" className="text-green-500 hover:underline">Terms of Service</a> and <a href="#" className="text-green-500 hover:underline">Privacy Policy</a>.
          </p>
        </form>
      </div>
    </div>
  );
};

export default RegisterPage;