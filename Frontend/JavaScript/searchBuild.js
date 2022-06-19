const build = document.querySelector("#searchBuild");

addEventListener("submit", async (ev) => {
    ev.preventDefault();
    await fetch(`http://25.33.228.221:3000/submit?build=${build.value}`, {
        method: "POST",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*"
        }
    }).then(res => {
        if (res.status === 200) {
            window.location.replace("/searchBuild.html");
        }
        else if(res.status === 404)
        {
            alert("Couldn't search build. PLease try again!");
        }
    })
})