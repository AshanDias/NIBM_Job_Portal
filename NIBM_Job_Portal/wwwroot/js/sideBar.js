function changeSideBarButtonStatus(buttonID) {
    resetActiveClass();
    switch (buttonID) {
        case "sidebar_dashboard":
            $("#sidebar_dashboard").addClass("text-primary");
            break;
        case "sidebar_job":
            $("#sidebar_job").addClass("text-primary");
            break;
        case "sidebar_profile":
            $("#sidebar_profile").addClass("text-primary");
            break;
        case "sidebar_company":
            $("#sidebar_company").addClass("text-primary");
            break; 
    } 
}

function resetActiveClass() {
    //nav - link
    var arr = ["#sidebar_dashboard", "#sidebar_job", "#sidebar_profile", "#sidebar_company"];
    for (var i in arr) {
        $(i).append("nav-link")

    }

}

