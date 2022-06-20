const user_email = document.querySelector("#exampleInputEmail1");
const user_password = document.querySelector("#exampleInputPassword1");

addEventListener("submit", async (ev) => {
    ev.preventDefault();
    const user = {
        email: user_email.value,
        password: user_password.value
    }
    await fetch(`http://localhost:5089/user?email=${user.email}&password=${user.password}`, {
        method: "GET",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
        },

    }).then(async res => {
        let stat = res.status;
        if (stat === 200) {
            window.location.replace("index.html");
        }
        else if(stat === 400) {
            var perror = await res.text();
            alert(perror);
        }
    })
})