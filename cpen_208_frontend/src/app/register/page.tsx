import React from 'react';

const Home: React.FC = () => {
  return (
    <div className="flex min-h-screen items-center justify-center bg-gray-100">
      <div className="flex max-w-4xl shadow-lg">
        {/* Left Section */}
        <div className="hidden lg:flex flex-col justify-center p-8 bg-purple-500 rounded-l-lg text-white">
          <h1 className="text-4xl font-bold mb-4">Learn From World&apos;s Best Instructors Around The World.</h1>
          <div className="mt-8 flex flex-col space-y-4">
            {/* <img src="/path-to-your-image.png" alt="Illustration" /> */}
          </div>
        </div>

        {/* Right Section */}
        <div className="flex flex-col justify-center p-8 bg-black rounded-r-lg w-full lg:w-1/2">
          <h2 className="text-3xl font-semibold mb-6">Create Account</h2>
          <form className="space-y-4">
            <input
              type="text"
              placeholder="Full Name"
              className="w-full p-3 text-black border border-gray-300 rounded-lg focus:outline-none focus:border-purple-500"
            />
            <input
              type="email"
              placeholder="Email Address"
              className="w-full text-black p-3 border border-gray-300 rounded-lg focus:outline-none focus:border-purple-500"
            />
            <input
              type="password"
              placeholder="Password"
              className="w-full text-black p-3 border border-gray-300 rounded-lg focus:outline-none focus:border-purple-500"
            />
            <div className="flex items-center">
              <input type="checkbox" className="mr-2" />
              <span>I agree to the <a href="#" className="text-purple-500">Terms of service</a> and <a href="#" className="text-purple-500">Privacy Policy</a></span>
            </div>
            <button
              type="submit"
              className="w-full p-3 bg-purple-500 text-white rounded-lg hover:bg-purple-600"
            >
              Sign Up
            </button>
          </form>
          <div className="mt-6 text-center">
            <p>Or Sign Up With</p>
            <div className="flex justify-center space-x-4 mt-2">
              {/* Replace the # with the actual links */}
              <a href="#" className="text-gray-500"><i className="fab fa-google"></i></a>
              <a href="#" className="text-gray-500"><i className="fab fa-facebook"></i></a>
              <a href="#" className="text-gray-500"><i className="fab fa-instagram"></i></a>
              <a href="#" className="text-gray-500"><i className="fab fa-twitter"></i></a>
            </div>
          </div>
          <div className="mt-6 text-center">
            <p>Already have an account? <a href="#" className="text-purple-500">Sign in</a></p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;