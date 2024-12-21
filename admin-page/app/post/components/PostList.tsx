'use client'
import React, { useState, useEffect } from "react";
import PostCard from "./PostCard";

function PostList() {
  const [postList, setPostList] = useState([]);

  const fetchPosts = async () => {
    try {
      const response = await fetch("http://112.137.129.161:1803/api/v1/news");
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const result = await response.json();
      setPostList(result);
    } catch (err) {
      console.log(err.message);
    }
  };

  useEffect(() => {
    fetchPosts();
  }, []);

  function handleDeletePost (postId: number) {
    fetch(`http://112.137.129.161:1803/api/v1/news/${postId}`, {
      method: "DELETE"
    }).then((response) => {
      console.log(response);
      fetchPosts();
    })
  }

  return (
    <div>
      {postList.map((post, index) => {
        return (
          <div className="flex-row" key={index}>
            <PostCard
              postId={post.news_id}
              title={post.title}
              content={post.content}
              category={post.category}
              handleDeletePost={handleDeletePost}
            />
          </div>
        );
      })}
    </div>
  );
}

export default PostList;
