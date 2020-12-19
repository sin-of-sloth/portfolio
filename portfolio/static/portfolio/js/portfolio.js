window.addEventListener('load', function () {
    document.getElementById('theme-toggle').checked = false;
    if(document.getElementById('theme').className == 'dark') {
        document.getElementById('blossom_container').style.display = 'block';
    }

    for (var i = 0; i < 300; i++) {
        var star = '<div class="star" style="animation: twinkle '+((Math.random()*5) + 5)+'s linear '+((Math.random()*5) + 5)+'s infinite; top: '+Math.random()*$(window).height()+'px; left: '+Math.random()*$(window).width()+'px;"></div>';
        $('body').append(star);
    }

    var theme_cookie = getCookie('theme');
    if(theme_cookie == null) {
        document.cookie = "theme=dark;"
        theme_cookie = "dark";
    }

    if(theme_cookie == "dark") {
        document.getElementById('theme').href = dark_theme;
        document.getElementById('theme').className = "dark";
        document.getElementById('blossom_container').style.visibility = 'hidden';   
    } else {
        document.getElementById('theme').href = light_theme;
        document.getElementById('theme').className = "light";
        document.getElementById('blossom_container').style.visibility = 'visible';   
    }

})

function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    return decodeURI(dc.substring(begin + prefix.length, end));
} 

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
        document.cookie = "theme:light";
    } else {
        document.getElementById('theme').href = dark_theme;
        document.getElementById('theme').className = "dark";
        document.getElementById('blossom_container').style.visibility = 'hidden';
        document.cookie = "theme:dark";
    }
}