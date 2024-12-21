"use client";
import React, { useState } from "react";

interface PostDetails {
  postId: number;
  title: string;
  category: string;
  content: string;
}

function EditPost(props: PostDetails) {
  const [newTitle, setNewTitle] = useState(props.title);
  const [newContent, setNewContent] = useState(props.content);

  function handleNewTitle(e) {
    setNewTitle(e.target.value);
  }

  function handleNewContent(e) {
    setNewContent(e.target.value);
  }

  function handleEditPost() {
    if (newTitle && newContent) {
      const post = {
        title: newTitle,
        category: props.category,
        content: newContent,
      };
      console.log(post);
      fetch(`http://112.137.129.161:1803/api/v1/news/${props.postId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(post),
      }).then((response) => {
        console.log(response);
        window.location.reload();
      });
    }
  }

  return (
    <div
      className="modal fade"
      id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabIndex={-1}
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div className="modal-dialog">
        <div className="modal-content">
          <div className="modal-header">
            <h1 className="modal-title fs-5" id="staticBackdropLabel">
              Edit Post
            </h1>
            <button
              type="button"
              className="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div className="modal-body">
            <div className="mb-4">
              <label
                htmlFor="title"
                className="block text-sm font-medium text-gray-700"
              >
                New Title:
              </label>
              <input
                type="text"
                id="title"
                name="title"
                placeholder="Enter new title"
                value={newTitle}
                onChange={handleNewTitle}
                required
                className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
              />
            </div>

            <div className="mb-4">
              <label
                htmlFor="postBody"
                className="block text-sm font-medium text-gray-700"
              >
                New Content:
              </label>
              <textarea
                id="postBody"
                name="postBody"
                placeholder="Write your post here..."
                value={newContent}
                onChange={handleNewContent}
                required
                className="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm resize-y min-h-[100px] max-h-[300px]"
              />
            </div>
          </div>
          <div className="modal-footer">
            <button
              type="button"
              className="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button
              type="button"
              className="btn btn-primary"
              onClick={handleEditPost}
            >
              Update
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default EditPost;
