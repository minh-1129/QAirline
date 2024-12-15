import Header from "@/app/components/Header";
import Hero from "@/app/components/Hero";
import SearchTabs from "./components/SearchTabs/SearchTabs";

export default function Home() {
  return (
    <div>
      <Header />
      <Hero />
      <SearchTabs />
    </div>
  );
}
