"use client";
import React, { useState } from "react";
import Select from "react-select";

export const categories = [
  {
    value: "Announcement",
    label: "Announcement",
  },
  {
    value: "News",
    label: "News",
  },
  {
    value: "Promotion",
    label: "Promotion",
  },
];

function NewPostInputForm() {
  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  const [category, setCategory] = useState();

  function handleTitle(e) {
    setTitle(e.target.value);
  }

  function handleContent(e) {
    setContent(e.target.value);
  }

  function handleCategory(e) {
    setCategory(e);
  }

  function handleSubmitPost(e) {
    if (title && content && category) {
      const post = {
        title,
        category: category.value,
        content,
      };
      console.log(post);
      fetch("http://112.137.129.161:1803/api/v1/news", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(post),
      }).then((response) => {
        console.log("new post added");
        console.log(response);
      });
    }
  }

  return (
    <form
      id="flight-form"
      className="max-w-lg mx-auto p-6 bg-white shadow-md rounded-lg border-2 border-grey-700"
    >
      <h2 className="text-2xl font-semibold mb-6 text-gray-800">
        New Post Information
      </h2>

      <div className="mb-4">
        <label
          htmlFor="title"
          className="block text-sm font-medium text-gray-700"
        >
          Title:
        </label>
        <input
          type="text"
          id="title"
          name="title"
          placeholder="Enter title"
          value={title}
          onChange={handleTitle}
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="planeName"
          className="block text-sm font-medium text-gray-700"
        >
          Category:
        </label>
        <Select
          options={categories}
          value={category}
          onChange={handleCategory}
          className="mt-1"
          required
        />
      </div>

      <div className="mb-4">
        <label
          htmlFor="postBody"
          className="block text-sm font-medium text-gray-700"
        >
          Post Content:
        </label>
        <textarea
          id="postBody"
          name="postBody"
          placeholder="Write your post here..."
          value={content}
          onChange={handleContent}
          required
          className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm resize-y min-h-[100px] max-h-[300px]"
        />
      </div>

      <button
        type="submit"
        className="w-full text-white bg-blue-500 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 shadow-md focus:outline-none"
        onClick={handleSubmitPost}
      >
        Create Post
      </button>
    </form>
  );
}

export default NewPostInputForm;
