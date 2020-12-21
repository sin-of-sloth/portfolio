from django.shortcuts import render, redirect
from django.template import RequestContext
from .models import Project

def home(request):
    projects = Project.objects.all()
    response = render(request, 'portfolio/home.html', {'projects':projects})
    if(request.COOKIES.get('theme', '') == ''):
        response.set_cookie('theme', 'light')

    return response


def handler404(request, *args, **argv):
    return render(request, 'portfolio/404.html')