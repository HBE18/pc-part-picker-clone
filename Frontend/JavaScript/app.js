const register = document.querySelector("#reg-but");
const login = document.querySelector("#log-but");
const ul = document.querySelector(".ourDiv");
var isAuth;

const func = async () => {
    fetch("http://localhost:5089/user/auth",{
        method: "GET",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*"
        }
    }).then(res => {
        return res.json();
    }).then(res=>{
        isAuth =  res.status == 200;
        if(isAuth)
        {
            let ourUl = document.querySelector("#nav-ul");
            resultPage.style.visibility = "visible";
            ul.removeChild(login);
            register.setAttribute("href", "index.html");
            register.setAttribute("onClick","clk()");
            register.innerHTML = "Logout";
        }
    })
}