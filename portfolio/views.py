from django.shortcuts import render
from .models import Project

def home(request):
    projects = Project.objects.all()
    response = render(request, 'portfolio/home.html', {'projects':projects})
    if(request.COOKIES.get('theme', '') == ''):
        response.set_cookie('theme', 'light')

    return response