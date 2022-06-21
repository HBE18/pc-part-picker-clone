const build = document.querySelector("#searchBuild");
const evDiv = document.querySelector(".events");

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
        const newList = document.createElement("ul");
        newList.id = "buildList";
        res.forEach(element => {
            let myh2 = document.createElement("h2");
            myh2.textContent = element;
            newList.appendChild(myh2);
        });
        evDiv.replaceChild(newList,buildList);
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
        res.forEach(element => {
            let myh2 = document.createElement("h2");
            myh2.textContent = element;
            buildList.appendChild(myh2);
        });
    })
}

getAllBuilds();