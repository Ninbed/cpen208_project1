"use client";
import { useState } from "react";
import Head from "next/head";
import Image from "next/image";



export default function Home() {
  const [showPassword, setShowPassword] = useState(false);

  const togglePasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  return (
    <div className="flex min-h-screen">
      <Head>
        <title>Student Portal</title>
        <meta name="description" content="Student portal login page" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <div className="w-1/2 bg-gray-900 text-white flex flex-col justify-center p-10">
        <h1 className="text-4xl mb-6">Login</h1>
        <form>
          <div className="mb-4">
            <label htmlFor="username" className="block mb-2">
              Username
            </label>
            <input
             type="text"
              placeholder="Full Name"
          
              id="username"
              className="w-full p-2 border border-gray-300 rounded-md text-black"
            />
          </div>
          <div className="mb-4 relative">
            <label htmlFor="password" className="block mb-2">
              Password
            </label>
            <div className="">
              <input
                type={showPassword ? "text" : "password"}
                placeholder="Password"
                id="password"
                className="w-full p-2 border border-gray-300 rounded-md text-black"
              />

              <span
                onClick={togglePasswordVisibility}
                className="absolute right-3 top-[40px] cursor-pointer "
              >
                {showPassword ? "*" : "-"}
              </span>
            </div>
          </div>
          <div className="mb-6">
            <a href="#" className="text-purple-500">
              Forgot Password?
            </a>
          </div>
          <button type="submit" className="w-full p-2 bg-purple-500 rounded-md">
            Login
          </button>
        </form>
        <div className="mt-6">
          <span>Don&apos;t have an account?</span>
          <a href="#" className="text-purple-500 ml-2">
            Sign up
          </a>
        </div>
      </div>

      <div className="w-1/2 bg-purple-600 flex items-center justify-center p-10">
        <div className="text-center text-white">
          <h2 className="text-5xl mb-6">Welcome to student portal</h2>
          <p className="text-lg">Login to access your account</p>
          <div className="mt-10">
            <Image src="https://img.freepik.com/premium-photo/icon-representing-concept-education-degree-ceremony-icon-is-drawn-3d-modern-style-is-cartoony-minimal_76964-83204.jpg?size=626&ext=jpg&ga=GA1.2.2111037326.1718267428&semt=ais_user" width={300} height={300} alt="Student Portal" className="mx-auto rounded-xl"/>
            
          </div>
        </div>
      </div>
    </div>
  );
}