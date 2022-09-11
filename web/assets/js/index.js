var header = document.getElementsByTagName("header");
var mobileMenu = document.getElementById('js-mobile-menu');
var headerHeight = '66.36px';

mobileMenu.onclick = function() {
    var isClose = header.clientHeight === headerHeight;
    if (isClose) {
        header.style.height = "430px";
    } else {
        header.style.height = null;
    }
}
