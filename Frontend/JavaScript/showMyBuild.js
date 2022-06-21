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

async function getAllElements() {
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
            const elementType = element.split("Dropdown")[0].split("#")[1];
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


    }
}

async function getBuild() {
    await fetch(`http://localhost:5089/myBuilds/myBuild?uID=${sessionStorage.getItem("uID")}&name=${sessionStorage.getItem("build")}`, {
        method: "GET",
        mode: "cors",
        headers: {
            "Access-Control-Allow-Origin": "*"
        }
    })

}

//build = getBuild();