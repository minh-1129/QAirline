import React from "react";
import EditPost from "./EditPost";

interface PostDetails {
  postId: number;
  title: string;
  category: string;
  content: string;
  handleDeletePost: (postId) => void;
  handleEditPost: (postId) => void;
}

function PostCard(props: PostDetails) {
  return (
    <div className="max-w-lg mx-auto p-6 pt-2 bg-white shadow-md rounded-lg border-2 border-gray-700 mb-4">
      <div className="mb-2 grid grid-cols-2">
        <h1 className="text-2xl font-bold w-2/3">{props.category}</h1>
        <div className="flex flex-cols-2 ">
          <button
            className="w-3/4 text-white bg-red-600 hover:bg-red-700 active:bg-red-800 font-medium rounded-lg text-sm px-1 py-2.5 me-2 mb-2"
            onClick={() => props.handleDeletePost(props.postId)}
          >
            Delete
          </button>
          <button
            className="w-3/4 text-white bg-yellow-400 hover:bg-yellow-500 active:bg-yellow-600 font-medium rounded-lg text-sm px-1 py-2.5 me-2 mb-2"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            Edit
          </button>
          <EditPost
            title={props.title}
            category={props.category}
            content={props.content}
            postId={props.postId}
          />
        </div>
      </div>
      <h2 className="text-2xl font-semibold mb-4 text-gray-800">
        {props.title}
      </h2>
      <p className="text-gray-700 leading-relaxed">{props.content}</p>
    </div>
  );
}

export default PostCard;
