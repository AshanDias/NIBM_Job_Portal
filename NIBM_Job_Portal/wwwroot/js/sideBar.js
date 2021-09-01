function changeSideBarButtonStatus(buttonID) {
    resetActiveClass();
    switch (buttonID) {
        case "sidebar_dashboard":
            $("#sidebar_dashboard").addClass("active");
            break;
        case "sidebar_job":
            $("#sidebar_job").addClass("active");
            break;
        case "sidebar_profile":
            $("#sidebar_profile").addClass("active");
            break;
    } 
}

function resetActiveClass() {
    //nav - link
    var arr = ["#sidebar_dashboard", "#sidebar_job","#sidebar_profile"];
    for (var i in arr) {
        $(i).append("nav-link")

    }

}

