const build = document.querySelector("#searchBuild");

addEventListener("submit", async (ev) => {
    ev.preventDefault();
    await fetch(`http://localhost:5089/buildSearch?Name=${build.value}`, {
        method: "GET",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*"
        }
    }).then((res) => {
        return res.json();
    }).then((res) => {
        // Show results
    })
});

async function getAllBuilds()
{
    await fetch(`http://localhost:5089/buildSearch/all`, {
        method: "GET",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*"
        }
    }).then((res) => {
        return res.json();
    }).then((res) => {
        console.log(res);
    })
}

getAllBuilds();