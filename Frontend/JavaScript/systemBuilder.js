// function cpus() {
//     const content = document.getElementById("content-cpu");
//     content.innerHTML = "My Super CPU";
// }

// function myFunction() {
//     document.getElementById("mbDropdown").classList.toggle("show");
// }

window.onclick = function (event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
    else
    {
        const drpEnable = event.target.parentElement.children[1];
        drpEnable.classList.toggle("show");
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show') && openDropdown!= drpEnable) {
                openDropdown.classList.remove('show');
            }
        }
    }
}


const drp = document.querySelector("#mbDropdown");

var a = document.createElement("a");
a.innerHTML = "Dynamically Added";
a.onclick = () => {
    const liMb = document.querySelector("#li-mb");
    const drpMb = document.querySelector("#drp-mb");
    let span = document.createElement("span");
    span.textContent = a.innerHTML;
    liMb.replaceChild(span,drpMb);
}

drp.appendChild(a);
