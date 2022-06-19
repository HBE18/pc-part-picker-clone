/* function cpus() {
    const content = document.getElementById("content-cpu");
    content.innerHTML = "My Super CPU";
}

function myFunction() {
    document.getElementById("mbDropdown").classList.toggle("show");
} */

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
    else {
        const drpEnable = event.target.parentElement.children[1];
        drpEnable.classList.toggle("show");
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show') && openDropdown != drpEnable) {
                openDropdown.classList.remove('show');
            }
        }
    }
}

async function getDropdownItems(dropdownIDs){
    const link = "localhost:5089/systemBuilder"
    results = await Promise.all([
        fetch(`${link}/cpus`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/coolers`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/motherboards`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/memories`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/storages`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/gpus`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/cases`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/powers`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        }),
        fetch(`${link}/monitors`, {
            method: "GET",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*"
            }
        })
    ])

    const dataPromises = results.map(result => result.json())
    const finalData = await Promise.all(dataPromises);


    for (let index = 0; index < dropdownIDs.length; index++) {
        const element = dropdownIDs[index];
        const obj = finalData[index];
        const drp = document.querySelector(element);
        const elementType = element.split("Dropdown")[0];

        var a = document.createElement("a");
        a.innerHTML = obj.Name;
        a.onclick = () => {
            const liMb = document.querySelector(`#${elementType}`);
            const drpMb = document.querySelector(`#drp${elementType}`);
            let span = document.createElement("span");
            span.textContent = a.innerHTML;
            liMb.replaceChild(span, drpMb);
            let myA = document.createElement("a");
            myA.textContent = "edit";
            myA.className = "link";
            myA.style.cursor = "pointer";
            myA.onclick = () => {
                liMb.replaceChild(drpMb, span);
                liMb.removeChild(myA);
            }
            liMb.appendChild(myA);
        }

        drp.appendChild(a);
    }
}

getDropdownItems([
    "#cpuDropdown",
    "#coolerDropdown",
    "#mbDropdown",
    "#memoryDropdown",
    "#storageDropdown",
    "#gpuDropdown",
    "#caseDropdown",
    "#powerDropdown",
    "#monitorDropdown"
]);