function toggler() {
    if (document.getElementById('theme') == "{% static 'portfolio/css/dark.css' %}") {
        document.getElementById('theme').href = "{% static 'portfolio/css/dark.css' %}";
    } else {
        document.getElementById('theme').href = "{% static 'portfolio/css/light.css' %}"
    }
}