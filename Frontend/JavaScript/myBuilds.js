const buildList = document.querySelector("#buildList");

async function getAllBuilds()
{
    await fetch(`http://localhost:5089/myBuilds?uID=${sessionStorage.getItem("uID")}`, {
        method: "GET",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*"
        }
    }).then((res) => {
        return res.json();
    }).then((res) => {
        try {
            res.forEach(element => {
                let myh2 = document.createElement("h2");
                myh2.textContent = element;
                buildList.appendChild(myh2);
            });
        } catch (error) {
            let myh2 = document.createElement("h2");
                myh2.textContent = "You have no builds yet.";
                buildList.appendChild(myh2);
        }
    })
}

getAllBuilds();