// Print the shape of the x402 catalog so you can pick a service by price.
const res = await fetch('https://three.ws/.well-known/x402.json');
if (!res.ok) throw new Error(`x402.json returned ${res.status}`);
const doc = await res.json();
console.log(Object.keys(doc));
console.log(JSON.stringify(doc.service?.tagline ?? doc.service, null, 2));
