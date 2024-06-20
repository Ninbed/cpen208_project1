import React from 'react';

const LoginPage: React.FC = () => {
  return (
    <div className="min-h-screen flex items-center justify-center bg-cover bg-center bg-bg-img">
      <div className="bg-[#ffffffe3] rounded-lg shadow-lg p-8 flex">
          
        <div className="flex-1 max-w-2xl">
          <h2 className="text-2xl font-semibold mb-2">Sign In</h2>
          <p className="mb-6 text-gray-600">Welcome to Student Portal, Login to begin.</p>
          <form>
            <div className="mb-4">
              <label className="block text-sm font-medium text-gray-700">
                * Student ID 
              </label>
              <input
                type="Student ID"
                placeholder="Enter your Student ID"
                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
            <div className="mb-4">
              <label className="block text-sm font-medium text-gray-700">
                * Email Address 
              </label>
              <input
                type="Email Address"
                placeholder="Enter your Email Address"
                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
            <div className="mb-6">
              <label className="block text-sm font-medium text-gray-700">
                * Password
              </label>
              <input
                type="password"
                placeholder="Enter your password"
                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
            <button
              type="submit"
              className="w-full bg-green-500 text-white py-2 rounded-md hover:bg-blue-600"
            >
              Sign In
            </button>
            <button
              type="button"
              className="w-full mt-4 py-2 border border-green-500 text-black rounded-md hover:bg-gray-100"
            >
              Create an account
            </button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default LoginPage;