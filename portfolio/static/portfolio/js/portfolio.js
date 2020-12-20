window.addEventListener('load', function () {
    for (var i = 0; i < 300; i++) {
        var star = '<div class="star" style="animation: twinkle '+((Math.random()*5) + 5)+'s linear '+((Math.random()*5) + 5)+'s infinite; top: '+Math.random()*$(window).height()+'px; left: '+Math.random()*$(window).width()+'px;"></div>';
        $('body').append(star);
    }
});

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, {});
});

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.parallax');
    var instances = M.Parallax.init(elems, {});
});

function toggler() {
    if (document.getElementById('theme').className == "dark") {
        document.getElementById('theme').href = light_theme;
        document.getElementById('theme').className = "light";
        document.getElementById('blossom_container').style.visibility = 'visible';
        document.cookie = "theme=light;path=/";
    } else {
        document.getElementById('theme').href = dark_theme;
        document.getElementById('theme').className = "dark";
        document.getElementById('blossom_container').style.visibility = 'hidden';
        document.cookie = "theme=dark;path=/";
    }
}