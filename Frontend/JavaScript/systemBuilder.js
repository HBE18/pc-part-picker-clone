let price = document.querySelector("#price");
const build = {
    cpu:null,
    cooler:null,
    motherboard:null,
    memory:null,
    storage:null,
    gpu:null,
    case:null,
    psu:null,
    monitor:null
};

function addPrice(num){
    price.innerHTML = `${(Number(price.innerHTML)+num).toFixed(2)}`;
}

function minPrice(num){
    price.innerHTML = `${(Number(price.innerHTML)-num).toFixed(2)}`;
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

async function getDropdownItems(dropdownIDs){
    const link = "http://localhost:5089/systemBuilder"
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
        for(const obj of objs){
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
            
                case 'motherboard':
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
                    build.power = obj;
                    break;
            
                case 'monitor':
                    build.monitor = obj;
                    break;
            }
            addPrice(obj.price);
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
                switch (elementType) {
                    case 'cpu':
                        build.cpu = null;
                        break;
                
                    case 'cooler':
                        build.cooler = null;
                        break;
                
                    case 'motherboard':
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
                        build.power = null;
                        break;
                
                    case 'monitor':
                        build.monitor = null;
                        break;
                }
            }
            liMb.appendChild(myA);
        }

        drp.appendChild(a);
        }

        
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