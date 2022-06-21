const register = document.querySelector("#reg-but");
const login = document.querySelector("#log-but");
const ul = document.querySelector(".ourDiv");
var isAuth;

const func = () => {
    let authStat = sessionStorage.getItem("auth");
    isAuth = authStat === "true"? true:false;
    if(isAuth)
        {
            let ourUl = document.querySelector("#nav-ul");
            let myBuilds = document.querySelector("#mybuilds");
            myBuilds.style.visibility = "visible";
            ul.removeChild(login);
            register.setAttribute("href", "index.html");
            register.setAttribute("onClick","clk()");
            register.innerHTML = "Logout";
        }
}

function clk() {
    sessionStorage.setItem("auth", "false");
    sessionStorage.removeItem("uID");
}

func();