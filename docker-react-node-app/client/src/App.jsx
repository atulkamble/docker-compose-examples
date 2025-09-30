export default function App(){
  return (
    <div style={{fontFamily:"system-ui", margin:"10vh auto", maxWidth:600, textAlign:"center"}}>
      <h1>React + Node in Docker ⚓</h1>
      <p>Frontend served by Nginx, API on /api.</p>
      <a href="/api">Test API</a>
    </div>
  );
}