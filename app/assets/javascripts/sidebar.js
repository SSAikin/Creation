(function() {

    this.SideBar = function() {
        this.buttonOpen = null;
        this.state = false;

        const defaults = {
			autoExecute: false
		}

		if (arguments[0] && typeof arguments[0] === "object") {
			this.options = extendDefault(defaults, arguments[0]);
		}

        if (this.options.autoExecute == true) {
            this.setListeners();
        }
    }

    SideBar.prototype.setListeners = function() {
        this.buttonOpen = document.getElementsByClassName("button-open-sidebar")[0];
        this.hoverPlace = document.getElementById("side-bar-open");
        this.navbar = document.getElementById("mySidenav");

        this.hoverPlace.addEventListener("mouseover", showButton.bind(this));
        this.hoverPlace.addEventListener("mouseout", hideButton.bind(this));
        this.navbar.addEventListener("mouseover", showButton.bind(this));
        this.navbar.addEventListener("mouseout", hideButton.bind(this));
        this.buttonOpen.addEventListener("click", controlNav.bind(this));
        setDropDowns.call(this);
    }

    function setDropDowns() {
        let dropDowns = this.navbar.getElementsByClassName("drop-down");
        for (let i = 0; i < dropDowns.length; i++) {
            let actual = dropDowns[i];
            actual.addEventListener("click", setDropDown.bind(this, actual));
        }
    }

    function setDropDown(actual) {
        let container = actual.parentNode.getElementsByClassName("drop-down-content")[0]
        let all = document.getElementsByClassName("drop-down-content")
        for(let i = 0; i < all.length; i++) {
            all[i].classList.remove("drop-open");
            all[i].parentNode.getElementsByTagName("a")[0].classList.remove("selected")
        }
        actual.classList.toggle("selected")
        container.classList.toggle("drop-open")
    }

    function showButton(buttonOpen) {
        this.buttonOpen.firstElementChild.classList.remove("hide");
        this.buttonOpen.classList.remove("hide-button");
    }

    function hideButton(buttonOpen) {
        this.buttonOpen.firstElementChild.classList.add("hide");
        this.buttonOpen.classList.add("hide-button");
    }

    function controlNav() {
        if (this.state == true) {
            this.navbar.style.width = "60px";
            document.getElementById("main").style.marginLeft = "65px";
            document.getElementById("side-button").classList.remove("ico-left");
            document.getElementById("side-button").classList.add("ico-right");
            document.getElementsByClassName("logged")[0].classList.add("logged-close");
            this.hoverPlace.style.marginLeft = "60px";
            this.state = false
        }else {
            this.navbar.style.width = "260px";
            document.getElementById("main").style.marginLeft = "265px";
            document.getElementById("side-button").classList.add("ico-left");
            document.getElementById("side-button").classList.remove("ico-right");
            document.getElementsByClassName("logged")[0].classList.remove("logged-close");
            this.hoverPlace.style.marginLeft = "265px";
            this.state = true
        }
    }

    function extendDefault(source, properties) {
		var property;
		for (property in properties) {
			if (properties.hasOwnProperty(property)) {
				source[property] = properties[property];
			}
		}
		return source;
	}

})();
