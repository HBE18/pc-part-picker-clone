const user_email = document.querySelector("#exampleInputEmail1");
const user_password = document.querySelector("#exampleInputPassword1");

addEventListener("submit", async (ev) => {
    ev.preventDefault();
    const user = {
        email: user_email.value,
        password: user_password.value
    }
    await fetch(`http://25.33.228.221:3000/login`, {
        method: "POST",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
        },
        body: JSON.stringify(user)
    }).then(res => {
        let stat = res.status;
        if (stat === 200) {
            window.location.replace("index.html");
        }
        else if(stat === 404)
        {
            alert("Email or password is invalid");
        }
        else if(stat === 400) {
            console.error("Email or password is not string");
        }
        else if(stat === 401) {
            alert("This user's password is different");
        }
    })
})