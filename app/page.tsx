import {supabaseServer} from "@/lib/supabase-server";
import Storefront from "./storefront";
export default async function Home(){let products:any[]=[];try{const s=await supabaseServer();const {data}=await s.from("products").select("*").eq("published",true).order("created_at",{ascending:false});products=data??[]}catch{}return <Storefront products={products}/>;}