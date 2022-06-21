const compatibility = document.querySelector("#comp-val");
const saveBut = document.querySelector(".btn-success");
const funcJSN = {};
const link = "http://localhost:5089/systemBuilder"
if (sessionStorage.getItem("auth") === "true") {
    saveBut.style.visibility = "visible";
}


let price = document.querySelector("#price");
const build = {
    cpu: null,
    cooler: null,
    motherboard: null,
    memory: null,
    storage: null,
    gpu: null,
    case: null,
    psu: null,
    monitor: null,
    price: Number(price.innerHTML)
};

function addPrice(num) {
    price.innerHTML = `${(Number(price.innerHTML) + num).toFixed(2)}`;
}

function minPrice(num) {
    price.innerHTML = `${(Number(price.innerHTML) - num).toFixed(2)}`;
}

function createUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

async function saveBuild() {
    window.event.preventDefault();
    if (build.cpu == null || build.motherboard == null || build.memory == null) {
        alert("Please fill all the required parts.");
    }
    else if(compatibility.textContent === "Not Compatible!!")
    {
        alert("Some parts of the build is incompatible.");
    }
    else {
        let buildName = prompt("Please enter a build name:","Untitled");
        if(buildName === null)
        {
            buildName = "Untitled";
        }
        let storageT;
        let stroage;
        if (build.storage.hasOwnProperty("m2_ID")) {
            storage = `m2ID=${build.storage.m2_ID}&sataID=${createUUID()}`;
            storageT = "M2";
        }
        else {
            storage = `m2ID=${createUUID()}&sataID=${build.storage.sata_ID}`;
            storageT = "SATA";
        }
        await fetch(`${link}?name=${buildName}&userID=${sessionStorage.getItem("uID")}&${storage}&monitorID=${build.monitor.monitor_ID}&psuID=${build.psu.psU_ID}&gpuID=${build.gpu.gpU_ID}&memoryID=${build.memory.memory_ID}&motherboardID=${build.motherboard.motherBoard_ID}&price=${build.price}&coolerID=${build.cooler.cooler_ID}&cpuID=${build.cpu.cpU_ID}&caseID=${build.case.casE_ID}&storageT=${storageT}`, {
            method: "POST",
            mode: "cors",
            headers: {
                "Access-Control-Allow-Origin": "*",
                "Content-Type": "application/json"
            }
        }).then(async (res) => {
            if (res.status === 200) {
                alert("Build saved successfully.");
            }
            else {
                alert("Houston, we got a problem.");
                console.error(await res.text());
            }
        })
    }
}


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

async function getDropdownItems(dropdownIDs) {
    //window.event.preventDefault();
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
        fetch(`${link}/psus`, {
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
        const objs = finalData[index];
        for (const obj of objs) {
            const drp = document.querySelector(element);
            const elementType = element.split("Dropdown")[0].split("#")[1];

            var a = document.createElement("a");
            a.innerHTML = obj.name;
            a.onclick = () => {
                const liMb = document.querySelector(`#${elementType}`);
                const drpMb = document.querySelector(`#drp${elementType}`);
                let span = document.createElement("span");
                span.id = `s${elementType}`;
                switch (elementType) {
                    case 'cpu':
                        build.cpu = obj;
                        break;

                    case 'cooler':
                        build.cooler = obj;
                        break;

                    case 'mb':
                        build.motherboard = obj;
                        break;

                    case 'memory':
                        build.memory = obj;
                        break;

                    case 'storage':
                        build.storage = obj;
                        break;

                    case 'gpu':
                        build.gpu = obj;
                        break;

                    case 'case':
                        build.case = obj;
                        break;

                    case 'power':
                        build.psu = obj;
                        break;

                    case 'monitor':
                        build.monitor = obj;
                        break;
                }
                isCompatible();
                addPrice(obj.price);
                build.price = Number(price.innerHTML);
                span.textContent = obj.name;
                liMb.replaceChild(span, drpMb);
                let myA = document.createElement("a");
                myA.textContent = "edit";
                myA.className = "link";
                myA.style.cursor = "pointer";
                myA.onclick = () => {
                    liMb.replaceChild(drpMb, span);
                    liMb.removeChild(myA);
                    minPrice(obj.price);
                    build.price = Number(price.innerHTML);
                    switch (elementType) {
                        case 'cpu':
                            build.cpu = null;
                            break;

                        case 'cooler':
                            build.cooler = null;
                            break;

                        case 'mb':
                            build.motherboard = null;
                            break;

                        case 'memory':
                            build.memory = null;
                            break;

                        case 'storage':
                            build.storage = null;
                            break;

                        case 'gpu':
                            build.gpu = null;
                            break;

                        case 'case':
                            build.case = null;
                            break;

                        case 'power':
                            build.psu = null;
                            break;

                        case 'monitor':
                            build.monitor = null;
                            break;
                    }
                    isCompatible();
                }
                funcJSN[elementType] = myA.onclick;
                liMb.appendChild(myA);
            }

            drp.appendChild(a);
        }


    }
}


function isCompatible() {
    let flag = true;
    Object.keys(build).forEach(function(key) {
        if(build[key] === null)
        {}
        else
        {
            switch(key)
            {
                case "cpu":
                    if(build["motherboard"] === null)
                    {
                        break;
                    }
                    if(build[key].socket === build["motherboard"].motherBoard_Socket){}
                    else
                    {
                        flag = false;
                    }
                    break;
            }
        }
      });
      if(flag)
      {
        compatibility.textContent = "Compatible";
        compatibility.style.color = "lime";
      }
      else
      {
        compatibility.textContent = "Not Compatible!!";
        compatibility.style.color = "red";
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