const user_email = document.querySelector("#exampleInputEmail1");
const user_password = document.querySelector("#exampleInputPassword1");
const pass_confirm = document.querySelector("#exampleInputPassword2");

addEventListener("submit", async (ev) => {

    ev.preventDefault();
    if (user_password.value != pass_confirm.value) {
        alert("Passwords are different");
        return;
      }
      if (user_email.value === "" || user_password.value === "") {
        alert("Email and Password fields cannot be empty");
        return;
      }
    const user = {
        email: user_email.value,
        password: user_password.value
    }
    await fetch(`http://localhost:5089/user?email=${user.email}&password=${user.password}`, {
        method: "POST",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
        },

    }).then(async res => {
        let stat = res.status;
        if (stat === 200) {
            let uID = await res.text();
            sessionStorage.setItem("uID", uID);
            sessionStorage.setItem("auth", true);;
            window.location.replace("index.html");
        }
        else if(stat === 400) {
            var perror = await res.text();
            alert(perror);
        }
    })
})