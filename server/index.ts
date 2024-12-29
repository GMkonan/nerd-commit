import { $ } from "bun";

interface DataT {
	dates: string[];
	count: number;
}

const CORS_HEADERS = {
	headers: {
		"Access-Control-Allow-Origin": "*",
		"Access-Control-Allow-Methods": "OPTIONS, POST",
		"Access-Control-Allow-Headers": "Content-Type",
	},
};

const server = Bun.serve({
	port: 3000,
	async fetch(req) {
		if (req.method === "OPTIONS") {
			const res = new Response("Departed", CORS_HEADERS);
			return res;
		}

		const data = (await req.json()) as DataT;
		console.log("Received JSON:", data);

		await $`sh ../cmd.sh ${data.dates.join(",")} ${data.count}`;
		return Response.json({ success: true, data }, CORS_HEADERS);
	},
});

console.log(`Listening on ${server.url}`);
