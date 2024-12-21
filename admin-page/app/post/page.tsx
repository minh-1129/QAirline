import NewPostInputForm from "./components/NewPostInputForm";
import PostList from "./components/PostList";
import Header from "../components/Header";

function PostPage() {
  return (
    <>
      <Header />
      <div>
        <h1 className="page-title">Post Management</h1>
        <div className="grid grid-cols-[1fr_2fr]">
          <div className="left-side">
            <NewPostInputForm />
          </div>
          <div className="right-side">
            <PostList />
          </div>
        </div>
      </div>
    </>
  );
}

export default PostPage;
